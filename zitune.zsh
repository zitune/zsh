# bip at command end
function precmd() {echo -n -e "\a"}

# do not share history between terms...
unsetopt share_history

# ZINFRA like infra
export ZINFRA=/home/zitune/dev/vexatil/infra
export PATH=$ZINFRA/bin:$PATH

# Load keychain
# keychain -q --agents ssh id_rsa id_dsa

# Everyday aliases
c-cat()		{for a in $@; do colorize_via_pygmentize $a; done}
c-less()	{for a in $@; do colorize_via_pygmentize $a | less; done}
e()		{emacsclient -n $@ > /dev/null 2>&1}
health()	{/usr/bin/screen -O -S health -c ~/.config/screen_health}
j()		{if [ $# -eq 0 ]; then marks; else jump $@; fi}
loop()		{while [ 1 ]; do sh -c "$@"; done}
open_ports()	{sudo netstat -tulpen 2> /dev/null | grep "LISTEN"}
dontknow()      {echo -n "¯\\_(ツ)_/¯" | xclip}
def()           {echo "default_path = '$PWD'" | awesome-client}
dchroot()       {docker run --rm --privileged -ti $@ debian:stretch /bin/bash}



#historic
HISTSIZE=1000
SAVEHIST=5000
HISTFILE=~/.zshhistory

alias ltr='ls -ltr'
alias go='ssh-add'
alias t='urxvt &!'

#alias
alias xterm='xterm -bg black -fg white'
alias vi='vim'

alias rl='ssh -A root@localhost'
alias rscp='scp -o User=root'

alias offl='killall offlineimap;rm .offlineimap/*.lock; offlineimap'
alias asmo='firejail --name=asmo --profile=/home/zitune/.config/firejail/asmo.profile google-chrome  --user-data-dir=/home/zitune/.config/asmo --cipher-suite-blacklist=0x0033,0x0039,0x009E,0xcc15'


alias controller1="sudo  xboxdrv  --silent --detach-kernel-driver -d  --mimic-xpad --led 1"
alias controller2="sudo  xboxdrv  --silent --detach-kernel-driver -d  --mimic-xpad --led 2"




# Usefull bindings
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

# Some exports
export EDITOR=emacsclient
export LESS=-cex2MRX
export LESSOPEN='|~/.lessfilter %s'
export LOGCHECK=60
export PATH=$HOME/.scripts:$PATH
export READNULLCMD=${PAGER:-/usr/bin/pager}
export WATCH=all
export WATCHFMT="%n has %a %l from %M"

# Some completions
compctl -K _completemarks    j
