source $HOME/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-antigen.git/antigen.zsh

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
