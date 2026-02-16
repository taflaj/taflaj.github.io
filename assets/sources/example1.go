// example1.go

package main

import (
	"fmt"
	"math/rand/v2"
	"os"
	"strconv"
)

func main() {
	inside := 0
	n := 100_000_000
	if len(os.Args) > 1 {
		n, _ = strconv.Atoi(os.Args[1])
	}
	for range n {
		x := rand.Float64()
		y := rand.Float64()
		if x*x+y*y <= 1 {
			inside++
		}
	}
	fmt.Println(float64(inside) * 4 / float64(n))
}
