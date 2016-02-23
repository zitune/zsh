PROMPT='%{${fg_bold[white]}%}%n%{$reset_color%}%{${fg[white]}%}@%m%{$reset_color%} %{$fg[white]%}$%{$reset_color%} '
RPROMPT='%(?,,%{${fg_bold[red]}%}[%?] %{$reset_color%})$(git_prompt_info)%{$fg[green]%}%~%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
