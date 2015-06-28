DOTFILES=bash_aliases \
         bash_node \
         bashrc \
         byobu.profile.tmux.sel \
         dircolors \
         inputrc \
         npmrc \
         profile \
         welcome \

.PHONY: install

install:
	@for dotfile in $(DOTFILES) ; do \
		cp ~/.$$dotfile ~/.$$dotfile.bak ; \
		rm -f ~/.$$dotfile ; \
		ln -s $(CURDIR)/$$dotfile ~/.$$dotfile ; \
		ls -la ~/.$$dotfile ; \
	done
