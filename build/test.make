check_NAME=check_grafton

check_BINSRC=$(TESTDIR)/$(check_NAME).c
check_HEADER=$(TESTDIR)/$(check_NAME).h
check_SOURCES=$(filter-out $(check_BINSRC),$(shell find $(TESTDIR) -name *.c))
check_OBJECTS=$(check_SOURCES:$(TESTDIR)/%.c=$(OBJDIR)/%.o)
check_DEPS=$(LIBS) -lcheck
check_BINARY=$(BINDIR)/$(check_NAME)
check_SUITES=$(check_SOURCES:$(TESTDIR)/%.c=$(TESTDIR)/suites/%.suite)

# Flags
check_BIN_CFLAGS=-L"$(shell readlink -f ./$(LIBDIR)/)" -l$(grafton_NAME) -I$(TESTDIR) -I$(SRCDIR)

$(check_OBJECTS): $(check_SOURCES)

$(TESTDIR)/suites/%.suite: $(TESTDIR)/%.c
	@mkdir -p $(shell dirname $@)
	ruby build/test_suite_create.rb $< > $@

$(check_SUITES): $(check_SOURCES)

$(check_BINSRC): $(check_SUITES) $(check_HEADER)
	ruby build/test_runner_create.rb > $@

$(check_BINARY): $(check_BINSRC) $(check_OBJECTS) $(grafton_LIBRARY)
	####==> Building $@
	$(CC) ${CFLAGS} $(check_DEPS) ${check_BIN_CFLAGS} $(check_BINSRC) -o $@

check: $(check_BINARY) $(grafton_LIBRARY)
	####==> Running tests
	bin/check_grafton

CLEANFILES+=$(check_OBJECTS)
CLEANFILES+=$(check_SUITES)
CLEANFILES+=$(check_BINSRC)
# also clean out the generated suite directory
CLEANFILES+="test/suites"

DISTCLEANFILES+=$(check_BINARY)
