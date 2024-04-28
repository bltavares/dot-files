#!/bin/bash

cat \
	develop/develop.Brewfile \
	develop/bash.Brewfile \
	develop/lua.Brewfile |
	brew bundle install --file=-
