package main

import (
	"math/rand"
	"time"
)

const POPULATION = 100

func Qsort(data []uint32) {
	size := len(data)
	if size > 1 {
		pivot := data[0]
		lesser := make([]uint32, size)
		greater := make([]uint32, size)
		lesser_index := 0
		greater_index := 0
		for _, value := range data[1:] {
			if value < pivot {
				lesser[lesser_index] = value
				lesser_index++
			} else {
				greater[greater_index] = value
				greater_index++
			}
		}
		lesser = lesser[:lesser_index]
		greater = greater[:greater_index]
		Qsort(lesser)
		Qsort(greater)
		i := 0
		for _, value := range lesser {
			data[i] = value
			i++
		}
		data[i] = pivot
		i++
		for _, value := range greater {
			data[i] = value
			i++
		}
	}
}

func main() {
	// Setup
	rand.Seed(time.Now().UnixNano())
	data := make([]uint32, POPULATION)
	for i := 0; i < POPULATION; i++ {
		data[i] = uint32(rand.Intn(100))
	}

	// Process
	Qsort(data)

	// Output
	for _, value := range data {
		print(value, "\t")
	}
	print("\n")
}
