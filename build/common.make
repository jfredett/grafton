$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(shell dirname $@)
	$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDES)

clean:
	-rm -rf $(CLEANFILES) $(shell echo $(CLEANFILES) | xargs dirname)

distclean: clean
	-rm -rf $(DISTCLEANFILES)

