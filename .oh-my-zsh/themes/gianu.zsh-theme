# Oh-my-Zsh prompt created by gianu
#
# github.com/gianu
# sgianazza@gmail.com

#PROMPT='[%{$fg_bold[white]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)%{$reset_color%}]$ '

PROMPT=' %F{green}%B%K{green}█▓▒░%F{white}%K{green}%B%n@%m%b%F{green}%K{black}█▓▒░%F{white}%K{black}%B %D{%a %b %d} %D{%I:%M:%S%P} %{$reset_color%}$(git_prompt_info) $(git_prompt_status)
%}%F{green}%K{black}%B%~%F{blue}⚒%b%k%f '

RPROMPT="%(?.%{$fg[green]%}%B✔%b%{$reset_color%}.%{$fg[red]%}%B✘%b%{$reset_color%}) "

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} %{$fg[yellow]%}✔%{$reset_color%}"

# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED_BOLD%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED_BOLD%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW_BOLD%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN_BOLD%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$BLUE_BOLD%}untracked"
