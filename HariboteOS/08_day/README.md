### d
NOP // CPUを1クロックだけ休憩する

0xdfを送ると,A20GATE信号線がonになる
メモリの1MB以上を使えるようにする信号線

CR0(コントロールレジスタ0): OS以外がいじってはいけない大切なレジスタ

プロテクトモード(プロテクテッド・バーチャルアドレス・モード):
実際のアドレスではなくGDTを基準にしたもの（仮想）で使用すること

GDT, IDT
https://qiita.com/machine_engineer/items/90f0d085c1fef0a73b84
アドレス参照テーブルのようなもの（ページテーブルとやっていることは同じ）

ALIGNB:
キリがよくなるまでDB 0を入れる
