zsh
===

Zsh configuration using zgen.

```
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
source ${HOME}/.zgen/zgen.zsh
zgen clone zitune/zsh
ln -s ${HOME}/.zgen/zitune/zsh-master/zshrc $HOME/.zshrc
zgen reset
source ${HOME}/.zshrc
```
