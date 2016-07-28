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
    hybris42/zsh
EOBUNDLES

antigen theme hybris42/zsh hybris

antigen apply
