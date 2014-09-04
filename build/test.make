check_NAME=check_grafton

check_BINSRC=$(TESTDIR)/$(check_NAME).c
check_SOURCES=$(filter-out $(check_BINSRC),$(shell find $(TESTDIR) -name *.c))
check_OBJECTS=$(check_SOURCES:$(TESTDIR)/%.c=$(OBJDIR)/%.o)
check_DEPS=-lzmq -lczmq -lyajl -lcheck

check_BINARY=$(BINDIR)/$(check_NAME)

# Flags
check_BIN_CFLAGS=-L"$(shell readlink -f ./$(LIBDIR)/)" -l$(grafton_NAME) -I$(TESTDIR) -I$(SRCDIR)

CLEANFILES+=$(check_OBJECTS)
$(check_OBJECTS): $(check_SOURCES)

DISTCLEANFILES+=$(check_BINARY)
$(check_BINARY): $(check_OBJECTS) $(grafton_LIBRARY)
	####==> Building $@
	$(CC) ${CFLAGS} ${check_BIN_CFLAGS} $(check_BINSRC) $(check_DEPS) -o $@

check: $(check_BINARY) $(grafton_LIBRARY)
	####==> Running tests
	bin/check_grafton
