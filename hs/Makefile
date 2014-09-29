INPUT = $(shell ls -1 [0-9]*.hs | sort -n)
PROGRAMS = $(basename $(INPUT))
GHCFLAGS += --make -Wall -O2
#GHCFLAGS += -Werror
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
Euler.o: Euler.hs Makefile
	ghc $(GHCFLAGS) $<
	@touch $@
test: $(addsuffix .test,$(PROGRAMS))
clean:
	rm -f $(PROGRAMS) *.hi *.o *.prof
