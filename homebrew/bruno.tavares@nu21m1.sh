#!/bin/bash

operation="${1:-install}"

cat \
	develop/develop.Brewfile \
	develop/bash.Brewfile \
	develop/clojure.Brewfile \
	develop/rust.Brewfile |
	brew bundle $operation --file=-
