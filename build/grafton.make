grafton_NAME=grafton

grafton_BINSRC=$(SRCDIR)/$(grafton_NAME).c
grafton_SOURCES=$(filter-out $(grafton_BINSRC),$(shell find $(SRCDIR) -name *.c))
grafton_OBJECTS=$(grafton_SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
grafton_LIBNAME=lib$(grafton_NAME).so
grafton_LONG_LIBNAME=$(grafton_LIBNAME).$(VERSION)
grafton_DEPS=$(LIBS)

grafton_BINARY=$(BINDIR)/$(grafton_NAME)
grafton_LIBRARY=$(LIBDIR)/$(grafton_LIBNAME)

# Flags
grafton_BIN_CFLAGS=-L"$(shell readlink -f ./$(LIBDIR)/)" -l$(grafton_NAME)
grafton_LIB_CFLAGS=-shared

# Objects
CLEANFILES+=$(grafton_OBJECTS)
$(grafton_OBJECTS): $(grafton_SOURCES)

# Binary
DISTCLEANFILES+=$(grafton_BINARY)
$(grafton_BINARY): $(grafton_LIBRARY) $(grafton_BINSRC)
	####==> Building $@
	$(CC) ${CFLAGS} $(grafton_DEPS) ${grafton_BIN_CFLAGS} $(grafton_BINSRC) -o $@

# Library
DISTCLEANFILES+=$(grafton_LIBRARY)

$(grafton_LIBRARY): $(grafton_OBJECTS)
	####==> Building $@
	$(CC) ${LIB_CFLAGS} ${grafton_LIB_CFLAGS} $^ -o $@
