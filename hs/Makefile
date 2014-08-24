INPUT = $(wildcard [0-9]*.hs)
PROGRAMS = $(basename $(INPUT))
GHCFLAGS = -Wall -O2 --make
GHCFLAGS += -fno-warn-type-defaults -fno-warn-missing-signatures
#GHCFLAGS += -prof -auto-all

% %.o %.hi: %.hs Euler.hs Makefile
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
test: $(addsuffix .test,$(PROGRAMS))
clean:
	rm -f $(PROGRAMS) *.hi *.o *.prof
