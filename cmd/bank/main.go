package main

import (
	"bank/pkg/bank/card"	
	"bank/pkg/bank/types"
	"fmt"
)

func main() {
	cards := []types.Card{
		{
			Balance: 100,
			Active:  true,
			PAN:     `1324`,
		},
		{
			Balance: 1001,
			Active:  true,
			PAN:     `13245`,
		},
		{
			Balance: 100,
			Active:  false,
			PAN:     `132456`,
		},
		{
			Balance: 0,
			Active:  true,
			PAN:     `132456`,
		},
	}
	fmt.Println(card.PaymentSources(cards))

	//fmt.Println(ff)
}
