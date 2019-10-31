
#デフォルト操作

# default :
# 	./Q.app/Contents/MacOS/i386-softmmu.app/Contents/MacOS/i386-softmmu -L . -m 32 -localtime -std-vga -fda fdimage0.bin

QEMU		= qemu-system-i386
QEMU_ARGS	= -L . -m 32 -rtc base=localtime -vga std -drive file=fdimage0.bin,index=0,if=floppy,format=raw

default:
	$(QEMU) $(QEMU_ARGS)
