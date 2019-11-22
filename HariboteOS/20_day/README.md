### b, c
#### hlt.nas
- MOV AL, 'A' ; ALレジスタに文字(8bit)追加
- CALL 0xbe3 ; 0xbe3(asm_cons_putchar)を呼ぶ
#### naskfunc.nas
_asm_cons_putchar:

;void cons_puchar(struct CONSOLE *cons, int char, char move);
- push 1 ; move
- AND EAX, 0xff; ALの部分しか必要ない(文字は8bit)
- push EAX ; char
- push DWORD [0x0fec] ; *cons
- CALL _cons_putchar ; naskfuncからだからc言語で書いたcons_putcharが呼べる

###　h
#### naskfunc.nas
;_asm_hrb_api:
- PUSHAD ; 保存（全ての汎用レジスタのデータをstackにpush）
- PUSHAD ; hrb_apiに渡すためのPUSH





