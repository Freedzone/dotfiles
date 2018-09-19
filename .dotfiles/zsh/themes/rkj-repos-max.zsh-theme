# vim:ft=zsh foldmethod=marker
# remake of 'rkj-repos' OMZ bundled theme
# git dirty indicators removed due to performance issues (on Cygwin)
#

function hg_prompt_info {
  if (( $+commands[hg] )) && grep -q "prompt" ~/.hgrc; then
    hg prompt --angle-brackets "\
<hg:%{$fg[magenta]%}<branch>%{$reset_color%}><:%{$fg[magenta]%}<bookmark>%{$reset_color%}>\
</%{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[red]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
  fi
}

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}✱"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}✈"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %F{193}ﰚ-"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

function mygit() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
        echo " %{$fg_bold[blue]%}(%{$fg[red]%}${ref#refs/heads/}$(git_prompt_short_sha)%{$fg_bold[blue]%})"
  fi
}

function retcode() {}

# alternate prompt with git & hg
PROMPT_SYSTEM="%{$fg_bold[green]%}%n%b%F{13}@%f%{$fg[cyan]%}%m"
PROMPT_DIR="%{%F{11}%}%(5~|%-1~/…/%3~|%4~)"
PROMPT_DATETIME="%{$fg[green]%}"%D{" %a %b %d, "}"%{$fg[yellow]%}"%D{" %H:%M:%S"}
PROMPT=$'%{$fg_bold[blue]%}╓──[%{$fg_bold[blue]%}$PROMPT_SYSTEM]%{$reset_color%} - %{$fg_bold[blue]%}[$PROMPT_DIR%{$fg_bold[blue]%}]%{$reset_color%} - %{$fg_bold[blue]%}[%b$PROMPT_DATETIME%{$fg_bold[blue]%}]
%{$fg_bold[blue]%}╙─[%{$fg_bold[magenta]%}%?%{$fg_bold[blue]%}]$(mygit)$(hg_prompt_info) %{$fg_bold[blue]%}>%{$fg_bold[cyan]%}>%{$fg_bold[green]%}>%{$reset_color%} '
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '
