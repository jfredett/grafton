grafton_SOURCES=$(shell find $(SRCDIR) -name *.c)
grafton_OBJECTS=$(grafton_SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

grafton_BINSRC=$(SRCDIR)/main.c


BINARY=$(BINDIR)/grafton

LIBSHORTNAME=libgrafton.so
LIBNAME=$(LIBSHORTNAME).$(VERSION)

LIBRARY=$(LIBDIR)/$(LIBNAME)
LIBRARY_SHORTNAME=$(LIBDIR)/$(LIBSHORTNAME)

# Objects

CLEANFILES+=$(grafton_OBJECTS)
$(grafton_OBJECTS): $(grafton_SOURCES)

# Binary

DISTCLEANFILES+=$(BINDIR)/grafton

BIN_CFLAGS=-L"$(shell readlink -f ./$(LIBDIR)/)" -lgrafton

$(BINARY): $(grafton_BINOBJ) $(LIBDIR)/$(LIBSHORTNAME)
	$(CC) ${BIN_CFLAGS} $(grafton_BINSRC) -lgrafton -o $@

# Library

DISTCLEANFILES+=$(LIBRARY)
DISTCLEANFILES+=$(LIBRARY_SHORTNAME)

LIB_CFLAGS=-shared #-Wl,-soname,lib/libgrafton.so

$(LIBRARY): $(filter-out $(OBJDIR)/main.o,$(grafton_OBJECTS))
	$(CC) ${LIB_CFLAGS} $< -o $@

$(LIBDIR)/$(LIBSHORTNAME): $(LIBRARY)	
	cp $< $@
