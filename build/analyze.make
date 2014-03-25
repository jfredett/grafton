.PHONY: analyze analyze-view
analyze:
	scan-build -analyze-headers --use-analyzer Xcode make distclean all

analyze-view:
	scan-build -analyze-headers --use-analyzer Xcode -V make distclean all
