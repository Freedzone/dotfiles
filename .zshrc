# vim:foldmethod=marker

export DOTFILES=$HOME/.dotfiles
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/zsh

# use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# disable command auto-correction.
# ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  git
  zsh-syntax-highlighting
)

# add pacman plugin if arch
if command -v pacman >/dev/null 2>&1; then
  plugins=("${plugins[@]}" archlinux)
fi

# {{{ Options
# Make Vi mode transitions faster
export KEYTIMEOUT=1
# Extended globbing
setopt extendedglob
# }}}

# {{{ Setup environment

# Load $fg & co with color codes
autoload -U colors && colors

export PATH=$PATH:${HOME}/bin
export EDITOR=vim
# }}}

# {{{ Visuals
ZSH_THEME="rkj-repos-max"
# }}}

# {{{ Widgets

## Vi mode indicator
# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

# Add widgets
zle -N zle-keymap-select
# }}}

# start oh-my-zsh
source $ZSH/oh-my-zsh.sh

# source all additions
for i in $ZSH_CUSTOM/*.zsh; do
  source $i
done

# {{{ Speed up autocompletion
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' hosts off
zstyle ':completion:*:git:*' tag-order 'common-commands'

# Fix git files completion
# https://stackoverflow.com/questions/9810327/zsh-auto-completion-for-git-takes-significant-amount-of-time-can-i-turn-it-off
__git_files () {
  _wanted files expl 'local files' _files
}
# }}}

# quick source shell
alias sosh="source $HOME/.zshrc"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# Local config
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
