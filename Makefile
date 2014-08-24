MAGIC = all clean test

.PHONY: $(MAGIC)
$(MAGIC):
	make -C c $@
	make -C py $@
	make -C hs $@
