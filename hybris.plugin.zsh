# bip at command end
function precmd() {echo -n -e "\a"}

# do not share history between terms...
unsetopt share_history

# Everyday aliases
bthost()	{cat $INFRA/host/$1}
cless()		{for a in $@; do colorize_via_pygmentize $a | less; done}
e()		{emacsclient -n $@ > /dev/null 2>&1}
health()	{/usr/bin/screen -O -S health -c ~/.config/screen_health}
j()		{jump $@}
loop()		{while [ 1 ]; do sh -c "$@"; done}
open_ports()	{sudo netstat -tulpen 2> /dev/null | grep LISTEN"}
r()		{if [ $# -eq 1 ]; then ssh root@$1; else sudo su -; fi}


# Some exports
export EDITOR=emacsclient
export HISTFILE=~/.zhist
export HISTSIZE=5000
export INFRA=/home/hybris/dev/bearstech/bearstech/infra
export LESS=-cex2MRX
export LESSOPEN='|~/.lessfilter %s'
export LOGCHECK=60
export PATH=$INFRA/bin:$INFRA/../xen:$HOME/.scripts:$PATH
export READNULLCMD=${PAGER:-/usr/bin/pager}
export SAVEHIST=5000
export WATCH=all
export WATCHFMT="%n has %a %l from %M"

grep "^Subject: " /var/spool/mail/hybris | sed 's/^Subject: / * /'

# Google Cloud
# The next line updates PATH for the Google Cloud SDK.
source '/home/hybris/dev/bearstech/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
source '/home/hybris/dev/bearstech/google-cloud-sdk/completion.zsh.inc'
