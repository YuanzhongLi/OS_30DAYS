### a
- AL = 0x34; OUT(0x43, AL);
- AL = 割り込み周期の下位8bit; OUT(0x40, AL);
- AL = 割り込み周期の上位8bit; OUT(0x40, AL);

11932(0x2e9c)で約100Hz
IRQ(interrupt request)
