# Apply OS and User level configuration for the current host
apply:
	nix run --log-format internal-json -v .#activate |& nom --json
	nix run --log-format internal-json -v .#activate-user |& nom --json
.PHONY: apply

# Apply updates to all pinned versions
update:
	nvim --headless "+Lazy! sync" +qa
	nix flake update --log-format internal-json -v |& nom --json
.PHONY: update
