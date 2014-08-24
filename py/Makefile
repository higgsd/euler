INPUT = $(wildcard [0-9]*.py)

%.test: %.py
	@if [ "`head -n1 $< | cut -c3-`" != "`python $<`" ] ; then echo 'FAIL' && false ; fi

.PHONY: all clean
all clean:
