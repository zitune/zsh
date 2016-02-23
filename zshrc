source /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    # omz
    colored-man-pages
    colorize
    copydir
    copyfile
    extract
    git
    jump
    rsync
    ssh-agent
    systemadmin
    web-search
    z
    zsh_reload

    # local
    $HOME/.zsh --no-local-clone
EOBUNDLES

antigen theme $HOME/.zsh/hybris.zsh-theme

antigen apply
