#!/usr/bin/env bash

set -o errexit
set -o xtrace

export GOPATH=~/.go-shfmt-cache
BINARY="${GOPATH}/bin/shfmt"

check_and_install() {
	sudo install -D -m 755 -t /usr/local/bin "${BINARY}"
	exit 0
}

if [[ -x "${BINARY}" ]]; then
	# If we have a cached version sitting around
	check_and_install
else
	# Build it!
	sudo apt-get update
	sudo apt-get install golang-1.6-go
	/usr/lib/go-1.6/bin/go get github.com/mvdan/sh/cmd/shfmt
	check_and_install
fi

# Something went wrong
exit 1
