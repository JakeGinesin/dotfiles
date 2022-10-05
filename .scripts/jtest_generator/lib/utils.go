package lib

import (
	"bufio"
	"log"
	"os"
)

// tries to retrieve a classpath environment variable.
func tryGetClasspath() string {
	// try lookup linux env
	env, ok := os.LookupEnv("CLASSPATH")
	if ok {
		return env
	}
	// try lookup windows env
	env, ok = os.LookupEnv("%CLASSPATH%")
	if ok {
		return env
	}
	return ""
}

// gets the sub directories of the given directory
func getSubDirs(dirpath string) []string {
	entries, err := os.ReadDir(dirpath)
	if err != nil {
		log.Fatal(err)
	}

	acc := []string{}
	for _, entry := range entries {
		if entry.IsDir() {
			subpath := dirpath + "/" + entry.Name()
			acc = append(acc, subpath)
			acc = append(acc, getSubDirs(subpath)...)
		}
	}
	return acc
}

// transforms the given file (from path) into a slice of lines
func fromFileToLines(filepath string) [][]byte {
	// read the file, split it into an array of lines
	file, err := os.OpenFile(filepath, os.O_RDWR, 0655)
	if err != nil {
		log.Fatal(err)
	}

	// close file
	defer file.Close()

	sc := bufio.NewScanner(file)
	lines := make([][]byte, 0)
	for sc.Scan() {
		lines = append(lines, []byte(sc.Text()))
	}
	return lines
}

// flattens the given lines slice, and writes back to the given file
func flattenLinesWrite(lines [][]byte, filepath string) {
	flattened := make([]byte, 0)
	for _, l := range lines {
		flattened = append(flattened, append(l, []byte("\n")...)...)
	}

	// open file
	file, err := os.OpenFile(filepath, os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0655)
	if err != nil {
		log.Fatal(err)
	}

	defer file.Close()

	// write to file
	_, err = file.Write(flattened)
	if err != nil {
		log.Fatal(err)
	}
}

// removes an element at index from the given slice
func removeSlice[T any](s []T, i int) []T {
	return append(s[:i], s[i+1:]...)
}

// adds an element at index to the given slice
func addSlice[T any](s []T, elem T, i int) []T {
	temp := s
	temp = append(temp[:i+1], temp[i:]...)
	temp[i] = elem
	return temp
}
