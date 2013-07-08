DOTFILES=bash_aliases inputrc

.PHONY: install

install:
	@for dotfile in $(DOTFILES) ; do \
		cp ~/.$$dotfile ~/.$$dotfile.bak ; \
		rm -f ~/.$$dotfile ; \
		ln -s $(CURDIR)/$$dotfile ~/.$$dotfile ; \
		ls -la ~/.$$dotfile ; \
	done