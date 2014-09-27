zsh
===

Zsh configuration

Install
-------

* clone oh-my-zsh

  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-myzsh

* Link configuration

  ln -s $PWD/zshrc ~/.zshrc

  for i in `ls custom`; do ln -s $PWD/custom/$i ~/.oh-my-zsh/custom/$i; done
