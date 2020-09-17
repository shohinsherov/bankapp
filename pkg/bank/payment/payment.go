package payment

import (
	"bank/pkg/bank/types"
)


func Max(payments []types.Payment) types.Payment {
	max :=payments[0]
	for _, maxAmount := range payments {
		if max.Amount < maxAmount.Amount {
			max = maxAmount
		}
	
	}
	return max
}