package card

import (
	//"fmt"
	"bank/pkg/bank/types"
)

// Total функция
func Total(cards []types.Card) types.Money {
	sum := types.Money(0)
	for _, card := range cards {
		sum += card.Balance

	}
	return sum
}

// PaymentSources функция
func PaymentSources(cards []types.Card) []types.PaymentSource {
	var PaymentCards []types.PaymentSource
	for _, card := range cards {
		if card.Balance > 0 && card.Active {

			PaymentCards = append(PaymentCards, types.PaymentSource{

				Type:    `cart`,
				Number:  string(card.PAN),
				Balance: card.Balance,
			})
			//fmt.Println(PaymentCards)
		}
	}
	return PaymentCards
}
