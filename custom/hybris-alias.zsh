# Scripts files
if [ -d $HOME/scripts ]
then
    files=`ls $HOME/scripts`
    if [ "x$files" != "x" ]
    then
	for i in `ls --file-type $HOME/scripts`
	do
            ALIAS=`echo $i | cut -d. -f1`
            alias $ALIAS=$HOME/scripts/$i
	done
   fi
fi

# Everyday aliases
alias cp='nocorrect cp'       # no spelling correction on cp
alias cvlc-add='cvlc --playlist-enqueue'
alias grep='grep --color=auto'
alias h=history
alias j=jobs
alias l='ls -l'
alias la='ls -la'
alias ll='ls -l'
alias ls='ls --color=auto -F'
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias mv='nocorrect mv'       # no spelling correction on mv
alias wi='wicd-curses'

alias -g M='|more'
alias -g H='|head'
alias -g T='|tail'

configupdate() {cd ~/; git add config; git commit -m "config update"; git push; cd -}
e() {emacsclient -n $@ > /dev/null 2>&1}
git-send-email() {git send-email --smtp-server /usr/bin/msmtp $@}
history() {perl -lne 'm#: (\d+):\d+;(.+)# && printf "\033[94m%s\033[0m %s\n",scalar localtime $1,$2' ~/.zhist}
logtail() {tail -f $1 | ccze -A}
mutt() {echo -ne "\033]0;screen mutt\007" ; /usr/bin/screen -O -S mutt -c ~/.screenrc_mutt}
quicksave() {cp --backup=numbered "$@" /tmp/}
wallpaper() {rm -f /home/hybris/Pictures/wallpaper; ln -s `pwd`/$1 /home/hybris/Pictures/wallpaper}
whiteboard() {convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2"}

# System
mouseon() {xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 8 1}
mouseoff() {xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 8 0}
pulse-restart() {killall pulseaudio && /usr/bin/pulseaudio --start --log-target=syslog}
