$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(shell dirname $@)
	$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDES)

clean:
	-rm -rf $(CLEANFILES)

distclean: clean
	-rm -rf $(DISTCLEANFILES)

