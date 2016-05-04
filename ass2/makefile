parser: main.o gram.o scan.o	
	cc -o add main.o gram.o scan.o -lm

gram.c:
	bison -dt -o gram.c gram.y

scan.c: scan.c
	flex -t scan.l > scan.c

gram.o: gram.o
	cc    -c -o gram.o gram.c

scan.o: scan.o
	cc    -c -o scan.o scan.c

main.o: main.o
	cc    -c -o main.o main.c