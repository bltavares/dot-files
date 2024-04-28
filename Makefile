# Apply OS and User level configuration for the current host
apply:
	(cd homebrew && bash ./${USER}@${HOST}.sh)
	bash ./install.sh all
.PHONY: apply

# Apply updates to all pinned versions
update:
	nvim --headless "+Lazy! sync" +qa
	brew upgrade
.PHONY: update
