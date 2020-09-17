[33mcommit 710619e350561d514f5c9093d1555457e9840e5e[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: Shohin <Sokha.98@gmail.com>
Date:   Thu Sep 17 11:21:12 2020 +0500

    Добавлены функции и типи

[1mdiff --git a/cmd/bank/main.go b/cmd/bank/main.go[m
[1mnew file mode 100644[m
[1mindex 0000000..188c5f8[m
[1m--- /dev/null[m
[1m+++ b/cmd/bank/main.go[m
[36m@@ -0,0 +1,42 @@[m
[32m+[m[32mpackage main[m
[32m+[m
[32m+[m[32mimport ([m
[32m+[m	[32m"bank/pkg/bank/card"[m
[32m+[m	[32m"bank/pkg/bank/payment"[m
[32m+[m	[32m"bank/pkg/bank/types"[m
[32m+[m	[32m"fmt"[m
[32m+[m[32m)[m
[32m+[m
[32m+[m[32mfunc main() {[m
[32m+[m	[32mcards := []types.Card{[m
[32m+[m		[32m{Balance: 100,[m
[32m+[m			[32mActive: true},[m
[32m+[m		[32m{Balance: 100,[m
[32m+[m			[32mActive: true},[m
[32m+[m		[32m{Balance: 100,[m
[32m+[m			[32mActive: true},[m
[32m+[m	[32m}[m
[32m+[m	[32msumCard := card.Total(cards)[m
[32m+[m	[32mfmt.Println(sumCard)[m
[32m+[m
[32m+[m	[32mpaym := []types.Payment{[m
[32m+[m		[32m{[m
[32m+[m			[32mID: 1,[m
[32m+[m			[32mAmount: 1,[m
[32m+[m		[32m},[m
[32m+[m		[32m{[m
[32m+[m			[32mID: 2,[m
[32m+[m			[32mAmount: 3,[m
[32m+[m		[32m},[m
[32m+[m		[32m{[m
[32m+[m			[32mID: 3,[m
[32m+[m			[32mAmount: 5,[m
[32m+[m		[32m},[m
[32m+[m		[32m{[m
[32m+[m			[32mID: 4,[m
[32m+[m			[32mAmount: 4,[m
[32m+[m		[32m},[m
[32m+[m	[32m}[m
[32m+[m	[32mmax := payment.Max(paym)[m
[32m+[m	[32mfmt.Println(max.ID)[m
[32m+[m[32m}[m
[1mdiff --git a/pkg/bank/card/card.go b/pkg/bank/card/card.go[m
[1mnew file mode 100644[m
[1mindex 0000000..a06c885[m
[1m--- /dev/null[m
[1m+++ b/pkg/bank/card/card.go[m
[36m@@ -0,0 +1,14 @@[m
[32m+[m[32mpackage card[m
[32m+[m
[32m+[m[32mimport ([m
[32m+[m	[32m"bank/pkg/bank/types"[m
[32m+[m[32m)[m
[32m+[m
[32m+[m[32mfunc Total(cards []types.Card) types.Money {[m
[32m+[m	[32msum := types.Money(0)[m
[32m+[m	[32mfor _, card := range cards {[m
[32m+[m		[32msum += card.Balance[m
[32m+[m	[32m}[m
[32m+[m	[32mreturn sum[m
[32m+[m[32m}[m
[32m+[m
[1mdiff --git a/pkg/bank/payment/payment.go b/pkg/bank/payment/payment.go[m
[1mnew file mode 100644[m
[1mindex 0000000..17b5b4b[m
[1m--- /dev/null[m
[1m+++ b/pkg/bank/payment/payment.go[m
[36m@@ -0,0 +1,17 @@[m
[32m+[m[32mpackage payment[m
[32m+[m
[32m+[m[32mimport ([m
[32m+[m	[32m"bank/pkg/bank/types"[m
[32m+[m[32m)[m
[32m+[m
[32m+[m
[32m+[m[32mfunc Max(payments []types.Payment) types.Payment {[m
[32m+[m	[32mmax :=payments[0][m
[32m+[m	[32mfor _, maxAmount := range payments {[m
[32m+[m		[32mif max.Amount < maxAmount.Amount {[m
[32m+[m			[32mmax = maxAmount[m
[32m+[m		[32m}[m
[32m+[m[41m	[m
[32m+[m	[32m}[m
[32m+[m	[32mreturn max[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/pkg/bank/types/types.go b/pkg/bank/types/types.go[m
[1mnew file mode 100644[m
[1mindex 0000000..1ca7e1d[m
[1m--- /dev/null[m
[1m+++ b/pkg/bank/types/types.go[m
[36m@@ -0,0 +1,27 @@[m
[32m+[m[32mpackage types[m
[32m+[m
[32m+[m[32mtype Money int64[m
[32m+[m[32mtype Currency string[m
[32m+[m
[32m+[m[32mconst ([m
[32m+[m	[32mTJS Currency = "TJS"[m
[32m+[m	[32mRUB Currency = "RUB"[m
[32m+[m	[32mUSD Currency = "USD"[m
[32m+[m[32m)[m
[32m+[m
[32m+[m[32mtype PAN string[m
[32m+[m
[32m+[m[32mtype Card struct {[m
[32m+[m	[32mID       int[m
[32m+[m	[32mPAN      PAN[m
[32m+[m	[32mBalance  Money[m
[32m+[m	[32mCurrency Currency[m
[32m+[m	[32mColor    string[m
[32m+[m	[32mName     string[m
[32m+[m	[32mActive   bool[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mtype Payment struct {[m
[32m+[m	[32mID     int[m
[32m+[m	[32mAmount Money[m
[32m+[m[32m}[m
