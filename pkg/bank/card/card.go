package card

import (
	//"fmt"
	"bank/pkg/bank/types"
)

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
