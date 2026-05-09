# Apply updates to all pinned versions
update:
	nvim --headless "+Lazy! sync" +qa
	mise upgrade
.PHONY: update
