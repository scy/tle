#!/bin/sh

set -e

cmd="$1"
shift

case "$cmd" in
	build)
		nikola build
		;;
	sh|shell|bash)
		bash
		;;
	*)
		printf 'unknown command: %s\n' "$cmd" >&2
		exit 1
esac
