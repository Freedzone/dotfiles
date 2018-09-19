# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.3-2

export DOTFILES="$HOME/.dotfiles"

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
# See man bash for more options...
#
# Use case-insensitive filename globbing
shopt -s nocaseglob

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# extended glob
shopt -s extglob

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# History Options
#
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# PS1 function with git integration
# https://github.com/jaguililla/dotfiles/blob/master/bash/bashconfig
bold=$(tput bold)
reset=$(tput sgr0)
PROMPT_BEFORE="\[$bold\]\[$(tput setaf 6)\][\t]\[$(tput setaf 2)\] \[$(tput setaf 2)\]\u\[$(tput setaf 9)\]@\[$(tput setaf 2)\]\h \[$(tput setaf 3)\]\w\[$(tput setaf 1)\]\[$(tput setaf 6)\]"
PROMPT_AFTER="\\n\[$(tput setaf 5)\]\\$> \[$reset\]"

if [[ -n $(declare -F __git_ps1) ]]; then
    PROMPT_COMMAND='__git_ps1 "$PROMPT_BEFORE" "$PROMPT_AFTER"'
else
    PS1=$PROMPT_BEFORE$PROMPT_AFTER
fi

# Aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# Local config
[[ -f $HOME/.bashrc.local ]] && source $HOME/.bashrc.local
