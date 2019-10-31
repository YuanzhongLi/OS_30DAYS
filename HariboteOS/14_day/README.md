### d
おそらくQ.app(エミュレータ)のバグで画面真っ黒になる
cf) https://qiita.com/tatsumack/items/491e47c1a7f0d48fc762
```
$ brew install qemu
```

z_tools/qemu/Makefileを以下のように書き換える
```
QEMU		= qemu-system-i386
QEMU_ARGS	= -L . -m 32 -rtc base=localtime -vga std -drive file=fdimage0.bin,index=0,if=floppy,format=raw

default:
	$(QEMU) $(QEMU_ARGS)
```

asmhead.nas
```
MOV    DWORD [VRAM],0xdf000000 //元々は MOV    DWORD [VRAM],0xe0000000
```

### e
#### カクカク問題
私の環境の場合直接qemuを使うと表示はされるが常にカクカクするため
z_tools/qemu/Makefileを元に戻し(Q.appを使う), 必ずscrn320に設定するようにした
```
; VBEのバージョンチェック

		MOV		AX,[ES:DI+4]
		CMP		AX,0x0200
    JMP   scrn320     ; どうしてもカクカクするため320に強制変更
		;JB		scrn320			; if (AX < 0x0200) goto scrn320
```

#### カクカク問題（原因判明）
私の環境(2019/10/30現在, mac pro)ではOS自作入門が書かれた当初に比べてCPUの速度が格段に早くなってしまったため, for文で毎回io_cli()を実行するとqemuがそれに追いつかずカクカクになることがわかった.

対策として, bootpack.cではfifoのstatusが0でないときだけcli, stiを行うようにした.
cf) harib11e/bootpack.c

