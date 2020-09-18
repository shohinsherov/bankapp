package card

import (
	"bank/pkg/bank/types"
	"fmt"
)

func ExamplePaymentSources() {
	cards := []types.Card{
		{
			Balance: 100,
			Active:  true,
			PAN:     "1234",
		},
		{
			Balance: 1001,
			Active:  false,
			PAN:     "13245",
		},
	}
	res := PaymentSources(cards)

	for _, c := range res {
		fmt.Println(c.Number)
	}

	// Output: 1234
}
