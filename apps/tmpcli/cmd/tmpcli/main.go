package main

import (
	"fmt"
	"os"
)

var (
	Version   = "0.0.0"
	Commit    = "none"
	BuildTime = "unknown"
)

func main() {
	if len(os.Args) > 1 && (os.Args[1] == "--version" || os.Args[1] == "-V") {
		fmt.Printf("Version: %s\nCommit: %s\nBuild Time: %s\n", Version, Commit, BuildTime)
		return
	}

	fmt.Println("Hello World!")
}
