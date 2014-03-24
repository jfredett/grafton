$(OBJDIR)/%.o: $(SRCDIR)/%.c
	####==> Building $<
	@mkdir -p $(shell dirname $@)
	$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDES)

clean:
	####==> Cleaning
	-rm -rf $(CLEANFILES) $(shell echo $(CLEANFILES) | xargs dirname)

distclean: clean
	####==> Cleaning Distfiles
	-rm -rf $(DISTCLEANFILES)

