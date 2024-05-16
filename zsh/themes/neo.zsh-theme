PS1='%B[ %n]%b %{$fg[yellow]%}[  %~] %{$fg[cyan]%}$(git_repo_exists)
%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[green]%}"

git_repo_exists() {
	if [[ $(git_prompt_info) ]] {
		echo "on  $(git_prompt_info)"
	}
}
