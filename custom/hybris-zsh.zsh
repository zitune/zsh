if [ $UID -eq 0 ]; then
    umask 077;
else
    umask 022;
fi

autoload incremental-complete-word
autoload insert-files
autoload mere zed zfinit
autoload run-help
autoload -U compinit
autoload -U promptinit
autoload -U zen
compinit
promptinit
zle -N incremental-complete-word
zle -N insert-files
zmodload zsh/complist

bindkey m menu-select
bindkey i incremental-complete-word
bindkey j insert-files

fignore=(.o .c~ .pro)
fpath=(
        $fpath
        /root/.zen/zsh/scripts
        /root/.zen/zsh/zle )

limit core 0

setopt correct
setopt auto_cd
setopt hist_ignore_dups
setopt auto_list
setopt append_history
setopt auto_param_keys
setopt auto_param_slash
setopt no_bg_nice
setopt complete_aliases
setopt equals
setopt extended_glob
setopt extendedhistory
setopt hash_cmds
setopt hash_dirs
setopt mail_warning
setopt magic_equal_subst
setopt numericglobsort
setopt interactivecomments
setopt printeightbit

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*' format '-=> %d'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*' 'r:|[
._-]=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=5
zstyle ':completion:*' original true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

unsetopt inc_append_history

if [ "$TERM" != dumb ]; then echo -en "\033]0;${USER}@$(hostname)\007"; fi
