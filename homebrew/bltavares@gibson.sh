#!/bin/bash

cat \
	develop/develop.Brewfile \
	develop/bash.Brewfile \
	develop/rust.Brewfile |
	brew bundle install --file=-
