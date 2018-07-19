#!/bin/sh

# Go
# https://github.com/sourcegraph/go-langserver
go get -u github.com/sourcegraph/go-langserver

# Rubies
# https://github.com/castwide/solargraph
gem install solargraph
yard config --gem-install-yri

# Rust
# https://github.com/rust-lang-nursery/rls
rustup update
rustup component add rls-preview rust-analysis rust-src
