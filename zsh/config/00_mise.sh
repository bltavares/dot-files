#!/bin/bash

## Setup global host config
export MISE_SYSTEM_CONFIG_DIR="${HOME}/.config/mise/hosts/$(hostname | tr '[:upper:]' '[:lower:]')"
if [[ -z "$X_MISE_GLOBAL" && -d "$MISE_SYSTEM_CONFIG_DIR" ]]; then
	which mise >/dev/null &&
		X_MISE_GLOBAL=on exec mise en
fi

x() {
	if [[ $# -eq 0 ]]; then
		local local_mise="$(mise cfg ls --silent --no-header | grep -v "~/.config/mise" | wc -l)"
		printf "Available envs:\n\n"
		if [[ "$local_mise" -gt 0 ]]; then
			echo "(local)"
		fi
		for f in ~/.config/mise/mise.*.toml; do
			basename "${f//mise./}" .toml
		done
		return
	fi

	set -x
	typeset -aU X_MISE_ENV
	if [[ -z "$MISE_ENV" ]]; then
		declare -a X_MISE_ENV=("$@")
	else
		IFS="," read -r -A X_MISE_ENV <<<"$MISE_ENV"
		X_MISE_ENV+=("$@")
	fi

	if [[ -n "$X_MISE_LOCAL" ]]; then
		# exec to replace a (x .) active
		echo replacing mise en
		X_MISE_LOCAL=on MISE_ENV="${X_MISE_ENV[*]// /,}" MISE_SHELL=zsh exec mise en
	fi

	X_MISE_LOCAL=on MISE_ENV="${X_MISE_ENV[*]// /,}" MISE_SHELL=zsh mise en
}

xo() {
	if [[ $# -eq 0 ]]; then
		printf "Available envs:\n\n"
		for f in ~/.config/mise/mise.*.toml; do
			basename "${f//mise./}" .toml
		done
		return
	fi

	cp ~/.config/mise/mise.$1.toml mise.local.toml
}
