zsh
===

Zsh configuration

Install
-------

* clone oh-my-zsh

  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-myzsh

* Link configuration

  ln -s zshrc ~/.zshrc

  for i in `ls custom`; do ln -s custom/$i ~/.oh-my-zsh/custom/$i
