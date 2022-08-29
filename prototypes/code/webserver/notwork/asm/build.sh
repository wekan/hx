#uasm -elf64 websrv.asm
#gcc -o websrv websrv.o -no-pie
#musl-gcc -o websrv websrv.o -e main -nostartfiles -no-pie

nasm -f elf64 websrv.asm # assemble the program  
ld -s -o websrv websrv.o # link the object file nasm produced into an executable file  
#./hello # hello is an executable file
