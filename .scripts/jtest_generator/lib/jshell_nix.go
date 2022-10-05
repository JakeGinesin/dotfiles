//go:build darwin || dragonfly || freebsd || linux || nacl || netbsd || openbsd || solaris
// +build darwin dragonfly freebsd linux nacl netbsd openbsd solaris

package lib

import (
	"log"
	"os/exec"
	"syscall"
)

// runs jshell on the files (in source mode)
func (ctx SourceContext) jshell() {
	classpath := tryGetClasspath()

	jshellPath, err := exec.LookPath("jshell")
	if err != nil {
		log.Fatal(err)
	}

	paths := append([]string{""}, ctx.getAllFilePaths(ctx.Dir+"/delomboked")...)

	syscall.Exec(jshellPath, paths, []string{"CLASSPATH=" + classpath + ":" + ctx.Dir + "/lombok.jar"})

	// SETTINGS:
	// /set mode jtestez normal -command
	// /set truncation jtestez 100000000
	// /set feedback jtestez
}

// runs jshell on the files (in project mode)
func (ctx ProjectContext) jshell() {
	classpath := tryGetClasspath() + ":" + ctx.Dir + "/compiled.jar"

	jshellPath, err := exec.LookPath("jshell")
	if err != nil {
		log.Fatal(err)
	}

	paths := []string{""}

	syscall.Exec(jshellPath, paths, []string{"CLASSPATH=" + classpath})

	// SETTINGS:
	// /set mode jtestez normal -command
	// /set truncation jtestez 100000000
	// /set feedback jtestez
}
