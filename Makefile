assemble:
	nasm -f elf64 -o ./obj/${file}.o ./src/${file}.asm

linker: assemble
	ld ./obj/${file}.o -o ./bin/${file}.out

run: linker
	./bin/${file}.out