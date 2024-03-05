## Commands

### Shells
```bash
# Jump to the local dev container
nix develop
# Jumpt to a specific shell environment
nix develop .#rust
```


### Check

```sh
# Trigger formatting of current project
flake fmt

# Run tests
nix flake check
```


### Apply home-manager changes
```sh
nix run .#activate-user
nix run .#activate-devcontainer
```
