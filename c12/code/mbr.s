.text
entry start
start:
 

    mov ax,cs
    mov ss,ax
    mov sp,#0x7c00  

    mov ah,#0x00
    mov al,#0x03
    int 0x10



    seg cs
    mov ax, gdt_base+0x7c00 
    seg cs
    mov dx, gdt_base+0x7c00 + 0x02
    mov bx,#16
    div bx

    mov ds,ax
    mov bx,dx

    mov dword 0(bx),#0x00
    mov dword 4(bx),#0x00

    mov dword 0x08(bx),#0x8000ffff
    mov dword 0x0c(bx),#0x0040920b
    seg cs
    mov word gdt_size + 0x7c00,#15
    seg cs
    lgdt gdt_size+0x7c00

    in al,#0x92 
    or al,#0x02
    out 0x92,al 
    cli

    mov eax,cr0
    or eax,#1
    mov cr0,eax 

    mov cx,#0x08

    mov ds,cx

    mov byte 0x00,#0x50
    mov byte 0x02,#0x72
    mov byte 0x04,#0x6F
    mov byte 0x06,#0x74
    mov byte 0x08,#0x65
    mov byte 0x0a,#0x63
    mov byte 0x0c,#0x74
    mov byte 0x0e,#0x20
    mov byte 0x10,#0x6D
    mov byte 0x12,#0x6F
    mov byte 0x14,#0x64
    mov byte 0x16,#0x65
    mov byte 0x18,#0x20
    mov byte 0x1A,#0x4F
    mov byte 0x01C,#0x4B
    mov byte 0x1E,#0x2E
  
    
    hlt
gdt_size:         .word 0
gdt_base:   .word 0x7e00,0x0000

.org 510
    .word 0xAA55
