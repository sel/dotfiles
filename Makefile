install:
	cp ~/.bash_aliases ~/.bash_aliases.bak
	rm -f ~/.bash_aliases
	ln -s $(CURDIR)/bash_aliases ~/.bash_aliases
