package lib

import (
	"bufio"
	"bytes"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"regexp"
	"strings"

	cp "github.com/otiai10/copy"
)

type ProjectContext struct {
	Dir string
}

func GenProjectContext(fps ...string) ProjectContext {
	if len(fps) <= 0 {
		log.Fatal("GenContext was given 0 file paths")
	}

	// create temp tmpdir
	tmpdir, err := ioutil.TempDir("", "jtestez")
	if err != nil {
		log.Fatal(err)
	}

	// create sources dir
	sourcesdir := tmpdir + "/src"
	err = os.Mkdir(sourcesdir, os.ModePerm)
	if err != nil {
		log.Fatal(err)
	}

	// copy over all files
	for _, fp := range fps {
		err = cp.Copy(fp, sourcesdir)
		if err != nil {
			log.Fatal(err)
		}
	}

	return ProjectContext{
		Dir: tmpdir,
	}

}

func (ctx ProjectContext) Run() {
	ctx.writeAnnot("")
	ctx.writeBTS("")
	ctx.delombok()
	ctx.compileJar()
	ctx.jshell()
}

func (ctx ProjectContext) compileJar() {
	// compile files
	paths := ctx.getAllFilePaths("/delomboked")

	classpath := tryGetClasspath()

	args := []string{"-cp", classpath + ":" + ctx.Dir + "/lombok.jar"}
	args = append(args, paths...)

	err := exec.Command("javac", args...).Run()
	if err != nil {
		log.Fatal(err)
	}

	// create jar archive
	err = exec.Command("jar", "--create", "--file", ctx.Dir+"/compiled.jar",
		"-C", ctx.Dir+"/delomboked", ".").Run()
	if err != nil {
		log.Fatal(err)
	}
}

func (ctx ProjectContext) writeBTS(relpath string) {
	path := ctx.Dir + "/src" + relpath
	entries, err := ioutil.ReadDir(path)
	if err != nil {
		log.Fatal(err)
	}

	data := BtsData
	if relpath != "" {
		pkg := strings.ReplaceAll(relpath, "/", ".")[1:]
		data = append([]byte(fmt.Sprintf("package %s;\n", pkg)), data...)
	}

	// write file
	ioutil.WriteFile(path+"/BetterToString.java", data, 0655)

	for _, entry := range entries {
		if entry.IsDir() {
			ctx.writeBTS(relpath + "/" + entry.Name())
		}
	}

}

// runs delombok to all the files in the temp dir
func (ctx ProjectContext) delombok() {
	lombokPath := ctx.Dir + "/lombok.jar"

	// write the lombok jar to the dir
	err := ioutil.WriteFile(lombokPath, LombokJarData, 0744)
	if err != nil {
		log.Fatal(err)
	}

	classpath := tryGetClasspath()

	// buildings the args...
	args := []string{"-jar", lombokPath, "delombok", ctx.Dir + "/src",
		"-d", ctx.Dir + "/delomboked", "--classpath", classpath + ":" + lombokPath}

	// run the jar to all the files, output to delomboked folder
	err = exec.Command("java", args...).Run()
	if err != nil {
		log.Fatal(err)
	}
}

// writes the lombok annotations to each class in the files
func (ctx ProjectContext) writeAnnot(relpath string) {
	path := ctx.Dir + "/src" + relpath
	entries, err := ioutil.ReadDir(path)
	if err != nil {
		log.Fatal(err)
	}

	for _, entry := range entries {
		if entry.IsDir() {
			ctx.writeAnnot(relpath + "/" + entry.Name())
		} else if strings.HasSuffix(entry.Name(), ".java") {
			fpath := path + "/" + entry.Name()

			sc := bufio.NewScanner(bytes.NewReader(ImportsData))
			importLines := make([][]byte, 0)
			for sc.Scan() {
				importLines = append(importLines, []byte(sc.Text()))
			}

			lines := fromFileToLines(fpath)

			// save first line, might be package
			firstSave := lines[0]

			importLines = append([][]byte{firstSave}, importLines...)
			lines = append(importLines, lines[1:]...)

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
				lines = addSlice(lines, annot, i+counter)
			}

			// flatten buffer
			flattenLinesWrite(lines, fpath)
		}
	}
}

func (ctx ProjectContext) getAllFilePaths(relpath string) []string {
	path := ctx.Dir + relpath
	entries, err := ioutil.ReadDir(path)
	if err != nil {
		log.Fatal(err)
	}

	filepaths := make([]string, 0)
	for _, entry := range entries {
		if entry.IsDir() {
			filepaths = append(filepaths, ctx.getAllFilePaths(relpath+"/"+entry.Name())...)
		} else if strings.HasSuffix(entry.Name(), ".java") {
			filepaths = append(filepaths, path+"/"+entry.Name())
		}
	}
	return filepaths
}
