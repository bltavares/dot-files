# Apply updates to all pinned versions
update:
	nvim --headless "+Lazy! sync" +qa
	mise upgrade
.PHONY: update

# Symlink files in the correct place
install:
	mise x -- rotz --dotfiles ${CURDIR} install
	mise x -- rotz --dotfiles ${CURDIR} link --force
.PHONY: install
