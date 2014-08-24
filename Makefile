TESTS = $(addsuffix .test,$(shell jot 75))
MAGIC = all clean $(TESTS)

.PHONY: $(MAGIC) test
$(MAGIC):
	make -C c $@
	make -C py $@
	make -C hs $@
test: $(TESTS)
