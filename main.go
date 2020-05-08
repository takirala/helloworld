package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Printf("Hello %v!", World())
	time.Sleep(1 * time.Hour)
}

func World() string {
	return "World"
}

