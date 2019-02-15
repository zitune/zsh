# load zgen
source "${HOME}/.zgen/zgen.zsh"


#
# classical
#

# postgres user
export PGUSER=postgres

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
alias e='emacs'
alias rssh='ssh -l root'
alias r='rssh'
alias rl='ssh -A root@localhost'
alias rscp='scp -o User=root'
alias ltr='ls -ltr'
alias go='ssh-add'
alias t='urxvt &!'
alias offl='killall offlineimap;rm .offlineimap/*.lock; offlineimap'
alias chrome='firejail --name=chrome google-chrome --cipher-suite-blacklist=0x0033,0x0039,0x009E,0xcc15'
alias fx='firejail --profile=/home/zitune/.config/firejail/firefox.profile --name=firefox firefox.real -P zitune'
alias asmo='firejail --name=asmo --profile=/home/zitune/.config/firejail/asmo.profile google-chrome  --user-data-dir=/home/zitune/.config/asmo --cipher-suite-blacklist=0x0033,0x0039,0x009E,0xcc15'
alias orisis='firejail --name=orisis --profile=/home/zitune/.config/firejail/orisis.profile google-chrome  --user-data-dir=/home/zitune/.config/orisis --cipher-suite-blacklist=0x0033,0x0039,0x009E,0xcc15'
#alias asmo='firejail --name=asmo --profile=/home/zitune/.config/firejail/asmo.profile opera '
alias monshow='ssh root@pidou monshow'
alias monshowo='ssh root@lee monshow'
alias bmon='monshow; monshowo'
alias controller1="sudo  xboxdrv  --silent --detach-kernel-driver -d  --mimic-xpad --led 1"
alias controller2="sudo  xboxdrv  --silent --detach-kernel-driver -d  --mimic-xpad --led 2"

# if the init scipt doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/colorize
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/jump
  zgen oh-my-zsh plugins/rsync
  zgen oh-my-zsh plugins/systemadmin
  zgen oh-my-zsh plugins/z

  # personnal configuration
  zgen load zitune/zsh zitune.zsh
  zgen load zitune/zsh bearstech.zsh
  zgen load zitune/zsh zitune.theme

  # generate the init script from plugins above
  zgen save
fi
