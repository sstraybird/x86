# -0: 使用16bit代码段　
# -a: 开启与GNU as，ld部分兼容性选项
AS86	= $(QUIET_CC)as86 -0 -a

# -0: 产生具有16bit魔数的头结构
LD86	= $(QUIET_LINK)ld86 -0

all:	Image

Image: mbr.s
	$(AS86) -o boot.o mbr.s
	$(LD86) -s -o boot boot.o