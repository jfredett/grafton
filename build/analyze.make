.PHONY: analyze analyze-view valgrind
analyze:
	scan-build -analyze-headers --use-analyzer Xcode make distclean all

analyze-view:
	scan-build -analyze-headers --use-analyzer Xcode -V make distclean all

valgrind-grafton: $(grafton_BINARY)
	valgrind  --leak-check=full $(grafton_BINARY)

valgrind-grafton-tests: $(check_BINARY)
	CK_FORK=no valgrind --leak-check=full $(check_BINARY)

valgrind: valgrind-grafton valgrind-grafton-tests
