package lib

import (
	_ "embed"
)

//go:embed assets/imports.txt
var ImportsData []byte

//go:embed assets/lombok.jar
var LombokJarData []byte

//go:embed assets/BetterToString.java
var BtsData []byte
