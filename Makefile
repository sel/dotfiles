DOTFILES = bash_aliases bash_profile bash_prompt bashrc gitconfig gitignore_global inputrc lessfilter nanorc welcome vimrc zshrc
SOURCEDIR = $(shell pwd)
TARGETDIR = ~

.PHONY: install

install:
	@for dotfile in $(DOTFILES) ; do \
			if [ ! -L $(TARGETDIR)/.$$dotfile ]; then \
				cp $(TARGETDIR)/.$$dotfile $(TARGETDIR)/.$$dotfile.bak ; \
				rm -f $(TARGETDIR)/.$$dotfile ; \
				ln -s $(SOURCEDIR)/$$dotfile $(TARGETDIR)/.$$dotfile ; \
			fi; \
			ls -la $(TARGETDIR)/.$$dotfile ; \
	done
