package lib

import (
	"bufio"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"strings"
	"sync"
)

type SourceContext struct {
	Dir   string
	Names []string
}

func GenSourceContext(fps ...string) SourceContext {
	if len(fps) <= 0 {
		log.Fatal("GenContext was given 0 file paths")
	}

	// create temp tmpdir
	tmpdir, err := ioutil.TempDir("", "jtestez")
	if err != nil {
		log.Fatal(err)
	}

	// add BetterToString to the dir
	err = ioutil.WriteFile(tmpdir+"/BetterToString.java", BtsData, 0655)
	if err != nil {
		log.Fatal(err)
	}

	var filenames []string
	for _, fp := range fps {
		entries, err := os.ReadDir(fp)
		if err != nil {
			log.Fatal(err)
		}

		fullpath, err := filepath.Abs(fp)
		if err != nil {
			log.Fatal(err)
		}

		// get file names, and copy over files
		for _, entry := range entries {
			name := entry.Name()
			if strings.LastIndex(name, ".java") == (len(name) - 5) {
				tmppath := tmpdir + "/" + name
				realpath := fullpath + "/" + name

				input, err := ioutil.ReadFile(realpath)
				if err != nil {
					log.Fatal(err)
				}

				err = ioutil.WriteFile(tmppath, append(ImportsData, input...), 0655)
				if err != nil {
					log.Fatal(err)
				}

				filenames = append(filenames, name)
			}
		}
	}

	return SourceContext{
		Dir:   tmpdir,
		Names: filenames,
	}
}

func (ctx SourceContext) Run() {
	ctx.writeAnnot()
	ctx.delombok()
	ctx.jshell()
}

// runs delombok to all the files in the temp dir
func (ctx SourceContext) delombok() {
	lombokPath := ctx.Dir + "/lombok.jar"

	// write the lombok jar to the dir
	err := ioutil.WriteFile(lombokPath, LombokJarData, 0744)
	if err != nil {
		log.Fatal(err)
	}

	// get all files with abs path
	filepaths := ctx.getAllFilePaths(ctx.Dir)

	// buildings the args...
	args := []string{"-jar", lombokPath, "delombok"}
	args = append(args, filepaths...)
	args = append(args, "-d", ctx.Dir+"/delomboked")

	// run the jar to all the files, output to src-delombok
	err = exec.Command("java", args...).Run()
	if err != nil {
		log.Fatal(err)
	}
}

// writes the lombok annotations to each class in the files
func (ctx SourceContext) writeAnnot() {
	var wg sync.WaitGroup
	for _, name := range ctx.Names {
		wg.Add(1)
		// it makes it asynchronous
		go func(name string) {
			fpath := ctx.Dir + "/" + name
			// read the file, split it into an array of lines
			file, err := os.OpenFile(fpath, os.O_RDWR, 0655)
			if err != nil {
				log.Fatal(err)
			}

			sc := bufio.NewScanner(file)
			lines := make([][]byte, 0)
			for sc.Scan() {
				lines = append(lines, []byte(sc.Text()))
			}

			// close file
			file.Close()

			// match regex on each line, get indexes of class lines
			indexes := make([]int, 0)
			for i, l := range lines {
				ok, err := regexp.Match("(class).*{", l)
				if err != nil {
					log.Fatal(err)
				}
				if ok {
					indexes = append(indexes, i)
				}
			}

			// write @Data annot to to each line before class
			for counter, i := range indexes {
				annot := []byte("@Data")
				lines = append(lines[:i+1+counter], lines[i+counter:]...)
				lines[i+counter] = annot
			}

			// flatten buffer
			flattened := make([]byte, 0)
			for _, l := range lines {
				flattened = append(flattened, append(l, []byte("\n")...)...)
			}

			// reopen file
			file, err = os.OpenFile(fpath, os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0655)
			if err != nil {
				log.Fatal(err)
			}

			defer file.Close()

			// write to file
			_, err = file.Write(flattened)
			if err != nil {
				log.Fatal(err)
			}

			wg.Done()
		}(name)
	}
	wg.Wait()
}

// helper that retuns all absolute filepaths from the given dir (including BetterToString)
func (ctx SourceContext) getAllFilePaths(dir string) []string {
	filepaths := make([]string, 0)
	for _, name := range append(ctx.Names, "BetterToString.java") {
		filepaths = append(filepaths, dir+"/"+name)
	}
	return filepaths
}
