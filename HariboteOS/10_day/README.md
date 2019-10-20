### a
- 切り捨て : 0..桁分とAND
- 切上 : 9..足して切り捨て

### c, d
cではsheet上の全てのピクセルについてrefreshの範囲にあるかどうかのif文を回して、refreshしているため、結局（画面端にぶつからない限り）計算量はsht->bxsize * sht->bysizeとなっているため、思ったより高速化ができていない
dではsheetに対する相対の範囲を先に求めることでsheet全体ではなく、sheetとrefresh範囲が重なる部分のみrefreshするのでより速くなる
