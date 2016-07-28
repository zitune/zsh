# bip at command end
function precmd() {echo -n -e "\a"}
function preexec() {print -Pn "\e]0;toto\a"}

# do not share history between terms...
unsetopt share_history

# SSH agent lives for 2 hours
# zstyle :omz:plugins:ssh-agent lifetime 2h

# Scripts files
SCRIPT_DIR=$HOME/.scripts
if [ -d $SCRIPT_DIR ]
then
    files=`ls $SCRIPT_DIR`
    if [ "x$files" != "x" ]
    then
	for i in `ls --file-type $SCRIPT_DIR`
	do
            ALIAS=`echo $i | cut -d. -f1`
            alias $ALIAS=$SCRIPT_DIR/$i
	done
   fi
fi

# Everyday aliases
alias j=jump
alias dnsfix="sudo service bind9 restart"
alias open_ports="sudo netstat -tulpen 2> /dev/null | grep LISTEN"
alias offlineimap="/usr/bin/screen -list offlineimap > /dev/null || /usr/bin/screen -d -m -S offlineimap offlineimap"
cless() {for a in $@; do colorize_via_pygmentize $a | less; done}
r() {if [ $# -eq 1 ]; then ssh root@$1; else sudo su -; fi}
health() {/usr/bin/screen -O -S health -c ~/.config/screen_health}

# Some exports
export EDITOR=emacsclient
export HISTFILE=~/.zhist
export HISTSIZE=5000
export INFRA=/home/hybris/dev/bearstech/bearstech/infra
export LESS=-cex2MRX
export LESSOPEN='|~/.lessfilter %s'
export LOGCHECK=60
export PATH=/usr/local/bin:$INFRA/bin:/home/hybris/dev/bearstech/bearstech/xen:$PATH
export READNULLCMD=${PAGER:-/usr/bin/pager}
export SAVEHIST=5000
export WATCH=all
export WATCHFMT="%n has %a %l from %M"

grep "^Subject: " /var/spool/mail/hybris | sed 's/^Subject: / * /'
