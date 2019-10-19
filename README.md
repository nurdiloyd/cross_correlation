# cross_correlation
an assembly code that makes full cross correlation

To run these code you need to NASM(The Netwide Assembler)

You can use above command to have some needed programs:
```
sudo apt-get install manpages-dev g++ patch strace ltrace linux-headers-$(uname -r) linux-source kernel-package fakeroot libncurses5 dev libfuse-dev virtualbox-guest-x11
```
Compiling and linking:
```
nasm -f elf32 -g cross.asm
gcc -c -g main_asm.c
gcc -g cross.o main_asm.o -o cross
```
Running the debugger:
```
gdb ./cross
```

Getting help:
```
help (all)        -> get list of classes of commands
help breakpoints  -> breakpoints
help running      -> runnig the program
help data         -> examining data
help info         -> list of info subcommands
```
