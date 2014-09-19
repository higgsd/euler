INPUT = $(wildcard [0-9]*.hs)
PROGRAMS = $(basename $(INPUT))
GHCFLAGS = -Wall -O2 --make
GHCFLAGS += -fno-warn-type-defaults -fno-warn-missing-signatures \
            -fno-warn-unused-do-bind
#GHCFLAGS += -prof -auto-all

% %.o %.hi: %.hs Euler.o Makefile
	ghc $(GHCFLAGS) $<
	@touch $@

%.test: %
	@echo -n $< '... '
	@if [ "`head -n1 $<.hs | cut -c4-`" != "`./$<`" ] ; then \
		echo 'FAIL' && false ; \
	else \
		echo 'OK' ; \
	fi

.PHONY: all clean test
all: $(PROGRAMS)
Euler.o: Euler.hs
	ghc $(GHCFLAGS) $<
	@touch $@
test: $(addsuffix .test,$(PROGRAMS))
clean:
	rm -f $(PROGRAMS) *.hi *.o *.prof
