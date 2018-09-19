# vim:ft=zsh foldmethod=marker

# stolen from https://github.com/joakimkarlsson/dotfiles/blob/master/.zshrc ^^
# {{{ Git status functions
ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[red]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$fg[blue]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}]"

# get the name of the branch we are on
function git_prompt_info() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
function parse_git_dirty() {
    local STATUS=''
    local FLAGS
    FLAGS=('--porcelain')

    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
        FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
        FLAGS+='--untracked-files=no'
    fi

    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)

    if [[ -n $STATUS ]]; then
        echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
    else
        echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi
}
# }}}

function display_main_prompt {
    local curr_time="%{$fg[green]%}[%*]"
    local curr_dir="%{$reset_color%}%~"
    local git_branch='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}'
    local vim_info='%{$fg[green]%}[ ${vim_mode}]%{$reset_color%}'

    echo "%{$fg[blue]%}┌── ${curr_time} ${curr_dir} ${git_branch} ${venv_info}
%{$fg[blue]%}└─%{$fg[magenta]%}$%{$reset_color%} "
}

function display_right_prompt {
    local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"

    echo "${return_code}"
}

export PROMPT="$(display_main_prompt)"
export RPS1="$(display_right_prompt)"
