# Apply updates to all pinned versions
update:
	nvim --headless "+Lazy! sync" +qa
	mise upgrade
.PHONY: update

# Symlink files in the correct place
install:
	mise x -- rotz --dotfiles ${PWD} install
	mise x -- rotz --dotfiles ${PWD} link --force
.PHONY: install
