#!/bin/sh

# Go
# https://github.com/sourcegraph/go-langserver
# Doesn't have autocomplete yet :/
# go get -u github.com/sourcegraph/go-langserver

# Rubies
# https://github.com/castwide/solargraph
gem install solargraph
yard config --gem-install-yri

# Rust
# https://github.com/rust-lang-nursery/rls
rustup update
rustup component add rls-preview rust-analysis rust-src

# Javascript/Typescript
# https://github.com/sourcegraph/javascript-typescript-langserver
npm i -g javascript-typescript-langserver
