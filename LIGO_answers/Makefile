CFLAGS=-I/usr/local/include/
LDIR =-L/usr/local/lib
LDFLAGS=-lgsl -lgslcblas
CC=gcc
inverse : inverse.c
	$(CC) $(CFLAGS) $(LDIR) $< -o $@ $(LDFLAGS)

