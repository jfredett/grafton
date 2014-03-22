$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDES)

clean:
	-rm -rf $(CLEANFILES)

distclean: clean
	-rm -rf $(DISTCLEANFILES)

