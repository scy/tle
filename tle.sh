#!/bin/sh

set -e

cmd="$1"
shift

case "$cmd" in
	build)
		nikola build
		;;
	autopush)
		cd
		rm -rf git
		mkdir git
		cd git
		# I'd love to have "git worktree" here...
		git clone https://github.com/scy/tle.git repo
		cd repo
		commit="$(git rev-parse --short HEAD)"
		nikola build
		mv output ..
		git checkout -b gh-pages origin/gh-pages
		rm -rf *
		mv ../output/* ../output/.gitignore .
		git add .
		git config user.name 'Tim Lives Everywhere Automated Build'
		git config user.email 'mail@timliv.es'
		git commit -m "Automated Build of $commit"
		git log --stat -n 1
		git push origin gh-pages
		;;
	sh|shell|bash)
		bash
		;;
	*)
		printf 'unknown command: %s\n' "$cmd" >&2
		exit 1
esac
