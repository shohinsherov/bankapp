package main

import (
	"bank/pkg/bank/card"
	"bank/pkg/bank/payment"
	"bank/pkg/bank/types"
	"fmt"
)

func main() {
	cards := []types.Card{
		{Balance: 100,
			Active: true},
		{Balance: 100,
			Active: true},
		{Balance: 100,
			Active: true},
	}
	sumCard := card.Total(cards)
	fmt.Println(sumCard)

	paym := []types.Payment{
		{
			ID: 1,
			Amount: 1,
		},
		{
			ID: 2,
			Amount: 3,
		},
		{
			ID: 3,
			Amount: 5,
		},
		{
			ID: 4,
			Amount: 4,
		},
	}
	max := payment.Max(paym)
	fmt.Println(max.ID)
}
