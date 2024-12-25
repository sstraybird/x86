dd bs=32 if=boot of=c.img  skip=1 conv=notrunc
bochs -f bochsrc
