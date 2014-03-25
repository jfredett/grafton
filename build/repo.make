.PHONY: push-wiki
push-wiki:
	git push wiki `git subtree split --prefix wiki`:master -f
