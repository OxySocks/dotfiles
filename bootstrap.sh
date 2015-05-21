#!/usr/bin/env bash
# Based on the awesome dotfiles repository by Mathias Bynens
# Available from https://github.com/mathiasbynens/dotfiles

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function bootstrapFiles() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	bootstrapFiles;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		bootstrapFiles;
	fi;
fi;
unset doIt;
