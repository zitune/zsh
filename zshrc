# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/colorize
  zgen oh-my-zsh plugins/copydir
  zgen oh-my-zsh plugins/copyfile
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/jump
  zgen oh-my-zsh plugins/rsync
  zgen oh-my-zsh plugins/ssh-agent
  zgen oh-my-zsh plugins/systemadmin
  zgen oh-my-zsh plugins/web-search
  zgen oh-my-zsh plugins/z
  zgen oh-my-zsh plugins/zsh_reload

  # personnal configuration
  zgen load hybris42/zsh hybris.plugin.zsh
  zgen load hybris42/zsh hybris.zsh-theme

  # generate the init script from plugins above
  zgen save
fi
