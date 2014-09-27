# Shut the f*ck up.
xset b off

# bip at command end
function precmd() {
  echo -n -e "\a"
  if [ "$TERM" != dumb ]; then echo -en "\033]0;${USER}@$(hostname)\007"; fi
}

# do not share history between terms...
unsetopt share_history

# "ctrl-x e" to edit command
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# dir colors
eval `dircolors $HOME/.oh-my-zsh/custom/hybris-dir-colors`
