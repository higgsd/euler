INPUT = $(wildcard [0-9]*.c)
PROGRAMS = $(basename $(INPUT))
CFLAGS += -O2 -Wall
LDFLAGS += -lgmp

%.test: %
	@echo -n $< '... '
	@if [ "`head -n1 $<.c | cut -c4- | rev | cut -c4- | rev`" != "`./$<`" ] ; then \
		echo 'FAIL' && false ; \
	else \
		echo 'OK' ; \
	fi

.PHONY: all clean test
all: $(PROGRAMS)
euler.o: euler.h queue.h tree.h Makefile
$(PROGRAMS): euler.o

test: $(PROGRAMS) $(addsuffix .test,$(PROGRAMS))
clean:
	rm -f *.o $(PROGRAMS)
