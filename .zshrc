# Path to your oh-my-zsh installation.
export ZSH=/home/tim/.oh-my-zsh

# ZSH Theme
ZSH_THEME="mh"

# ZSH Plugins
plugins=(git)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
PATH=$PATH:/home/tim/git/install-elixir-1.0.4/erlang_and_elixir/elixir-v1.0.4/bin

# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# Little alias to properly set the /var/www group for my user account
# http://askubuntu.com/questions/19898/whats-the-simplest-way-to-edit-and-add-files-to-var-www
varwwwgroup() {
	sudo adduser tim www-data
	sudo chgrp -R www-data /var/www
	sudo chmod -R g+rw /var/www
	find /var/www -type d -print0 | sudo xargs -0 chmod g+s
}

# PHP aliases
alias ac='php app/console'
alias acai='php app/console assets:install'
alias acsu='php app/console doctrine:schema:update --force'
alias accc='php app/console cache:clear --env=prod'

# The suggested way to set the ACL for symfony on systems that don't support chmod +a
# http://symfony.com/doc/current/book/installation.html
symfacl() {
	HTTPDUSER=`ps aux | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
	sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX app/cache app/logs
	sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX app/cache app/logs
}

export TERM=xterm-256color
