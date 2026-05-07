#!/bin/bash

## Set PS1

function colored_ps1() {
	if [[ -n "$X_COLOR_PS1" ]]; then
		echo "$X_COLOR_PS1"
		return
	fi

	local OS=$(uname -s)
	if [[ "Darwin" == "$OS" ]]; then
		local MD5="md5"
	else
		local MD5="md5sum"
	fi

	local host_num=$((0x$(hostname | $MD5 | cut -c1-8) % 216 + 1))
	local user_num=$((0x$(whoami | $MD5 | cut -c1-8) % 216 + 1))
	print -P "%{$FG[$user_num]%}%n%{$FG[$host_num]%}@%m%{$reset_color%}"
}

if which starship >/dev/null 2>&1; then
	export X_COLOR_PS1="$(colored_ps1)"
	eval "$(starship init zsh)"
fi

## Make non-break character clear on paste
nbsp=$'\u00A0'
bindkey -s $nbsp '^u'

## Move line up on terminal after submit
function preexec {
	if [[ -z "$NO_AUTOTOP" ]]; then
		tput cuu1
		tput el
		clear
		print -Pn $PS1
		print $1
	fi
}

function precmd {
	if [[ -z "$NO_AUTOTOP" ]]; then
		tput cup $(($(tput lines))) 0
	fi
}
