export LSCOLORS="Dxfxcxdxbxegedabagacad"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host}${current_dir} ${git_branch}
╰─%B$%b "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
