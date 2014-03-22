grafton_SOURCES=$(wildcard $(SRCDIR)/**.c)
grafton_OBJECTS=$(grafton_SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

CLEANFILES+=$(grafton_OBJECTS)
$(grafton_OBJECTS): $(grafton_SOURCES)

DISTCLEANFILES+=$(BINDIR)/grafton
$(BINDIR)/grafton: $(grafton_OBJECTS)
	$(CC) $(grafton_OBJECTS) -o $@
