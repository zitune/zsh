PROMPT='%{${fg_bold[white]}%}%n%{$reset_color%}%{${fg[white]}%}@%m $%{$reset_color%} '
RPROMPT='%{$fg[white]%}%~$(git_prompt_info)%{$reset_color%}%(?,,%{${fg_bold[red]}%} [%?]%{$reset_color%})'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%})%{$fg_bold[red]%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[yellow]%})"
