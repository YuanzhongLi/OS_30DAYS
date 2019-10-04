; hello-os
; TAB=4

    ORG   0x7c00

    JMP   entry
    DB    0x90
    DB    "RIYUANZH"
    DW    512
    DB    1
    DW    1
    DB    2
    DW    224
    DW    2880
    DB    0xf0
    DW    9
    DW    18
    DW    2
    DD    0
    DD    2880
    DB    0,0,0x29
    DD    0xffffffff
    DB    "HELLO-OS   "
    DB    "FAT12   "
    RESB  18

  ; プログラム本体

entry:
		MOV		AX,0			; レジスタ初期化
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg
putloop:
		MOV		AL,[SI]
		ADD		SI,1			; SIに1を足す
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e			; 一文字表示ファンクション
		MOV		BX,15			; カラーコード
		INT		0x10			; ビデオBIOS呼び出し
		JMP		putloop
fin:
    HLT
    JMP   fin

msg:
		DB		0x0a, 0x0a		; 改行を2つ
		DB		"hello, world"
		DB		0x0a			; 改行
		DB		0

		RESB	0x7dfe-$		; 0x7dfeまでを0x00で埋める命令

		DB		0x55, 0xaa

