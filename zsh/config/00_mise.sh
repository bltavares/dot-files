#!/bin/bash

## Setup global host config
export MISE_SYSTEM_CONFIG_DIR="${HOME}/.config/mise/hosts/$(hostname | tr '[:upper:]' '[:lower:]')"
if [[ -z "$X_MISE_GLOBAL" && -d "$MISE_SYSTEM_CONFIG_DIR" ]]; then
	which mise >/dev/null &&
		X_MISE_GLOBAL=on exec mise en
fi

x() {
	declare -aU VALID_ENVS
	local local_mise="$(ls mise.toml mise.*.toml)"
	if [[ $(wc -l <<<"$local_mise") -gt 0 ]]; then
		while read f; do
			f=$(cut -d' ' -f1 <<<"$f")
			f=$(basename "$f" .toml)
			VALID_ENVS+=("${f//mise./}")
		done <<<"$local_mise"
	fi
	for f in ~/.config/mise/mise.*.toml; do
		VALID_ENVS+=$(basename "${f//mise./}" .toml)
	done

	if [[ $# -eq 0 ]]; then
		printf "Available envs:\n\n"
		echo "${VALID_ENVS// /\n}"
		return
	fi

	typeset -aU X_MISE_ENV
	if [[ -z "$MISE_ENV" ]]; then
		declare -a X_MISE_ENV=("$@")
	else
		IFS="," read -r -A X_MISE_ENV <<<"$MISE_ENV"
		X_MISE_ENV+=("$@")
	fi

	if [[ ${#${X_MISE_ENV:|VALID_ENVS}} != 0 ]]; then
		echo "Contains invalid env: (${X_MISE_ENV})"
		return 1
	fi

	if [[ -n "$X_MISE_LOCAL" ]]; then
		# exec to replace a x on active session
		echo 'appending `mise en`' $MISE_ENV with $@
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
