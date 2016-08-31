.PHONY: prepare test after_success

prepare:
	@echo prepare
test:
	shellcheck .travis/*.sh
after_success:
	@echo yay!
