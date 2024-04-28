#!/bin/bash

cat \
	develop/develop.Brewfile \
	develop/bash.Brewfile \
	develop/clojure.Brewfile \
	develop/rust.Brewfile |
	brew bundle install --file=-
