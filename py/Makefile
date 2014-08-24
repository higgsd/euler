INPUT = $(wildcard [0-9]*.py)
PROGRAMS = $(basename $(INPUT))

%.test: %.py
	@echo -n $< '... '
	@if [ "`head -n1 $< | cut -c3-`" != "`python $<`" ] ; then \
		echo 'FAIL' && false ; \
	else \
		echo 'OK' ; \
	fi

.PHONY: all clean test
all:
test: $(addsuffix .test,$(PROGRAMS))
clean:
	rm -f *.pyc
