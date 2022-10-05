package main

import (
	"fmt"
	"os"

	"github.com/elleven11/jtestez/lib"
)

func main() {
	// NOTE: if the first argument is "-p", then we are in project mode. otherwise source mode
	if len(os.Args) > 1 && os.Args[1] == "-p" {
		proj := lib.GenProjectContext(os.Args[2:]...)
		fmt.Printf("MODE: PROJECT\ntempdir: %s\n", proj.Dir)
		proj.Run()
	} else {
		sources := lib.GenSourceContext(os.Args[1:]...)
		fmt.Printf("MODE: SOURCE\ntempdir: %s\nfiles: %v\n", sources.Dir, sources.Names)
		sources.Run()
	}
}
