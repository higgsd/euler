INPUT = $(wildcard [0-9]*.c)
PROGRAMS = $(basename $(INPUT))
CFLAGS += -O2 -Wall
LDFLAGS += -lgmp

%.test: %
	@if [ "`head -n1 $<.c | cut -c4- | rev | cut -c4- | rev`" != "`./$<`" ] ; then echo 'FAIL' && false ; fi

all: $(PROGRAMS)
euler.o: euler.h Makefile
$(PROGRAMS): euler.o

.PHONY: clean
clean:
	rm -f *.o $(PROGRAMS)
