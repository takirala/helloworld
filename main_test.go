package main

import (
	"testing"
	"fmt"
)

func Test_World(t *testing.T) {
	actual := World()
	if actual != "World" {
		t.Fail()
	}
	fmt.Println("Test passed")
}

