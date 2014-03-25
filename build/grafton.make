grafton_NAME=grafton

grafton_BINSRC=$(SRCDIR)/$(grafton_NAME).c
grafton_SOURCES=$(filter-out $(grafton_BINSRC),$(shell find $(SRCDIR) -name *.c))
grafton_OBJECTS=$(grafton_SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
grafton_LIBNAME=lib$(grafton_NAME).so
grafton_LONG_LIBNAME=$(grafton_LIBNAME).$(VERSION)
grafton_DEPS=-lzmq -lczmq -lyajl

BINARY=$(BINDIR)/$(grafton_NAME)
LIBRARY=$(LIBDIR)/$(grafton_LIBNAME)

# Flags
grafton_BIN_CFLAGS=-L"$(shell readlink -f ./$(LIBDIR)/)" -l$(grafton_NAME)
grafton_LIB_CFLAGS=-shared

# Objects
CLEANFILES+=$(grafton_OBJECTS)
$(grafton_OBJECTS): $(grafton_SOURCES)

# Binary
DISTCLEANFILES+=$(BINARY)
$(BINARY): $(LIBRARY)
	####==> Building $<
	$(CC) ${CFLAGS} ${grafton_BIN_CFLAGS} $(grafton_BINSRC) -l$(grafton_NAME) $(grafton_DEPS) -o $@

# Library
DISTCLEANFILES+=$(LIBRARY)

$(LIBRARY): $(grafton_OBJECTS)
	####==> Building $<
	$(CC) ${LIB_CFLAGS} ${grafton_LIB_CFLAGS} $< -o $@
