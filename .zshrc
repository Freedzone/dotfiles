# vim:foldmethod=marker

export DOTFILES=$HOME/.dotfiles
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/zsh

# use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

# {{{ Visuals
ZSH_THEME="rkj-repos-max"
# }}}

source $ZSH/oh-my-zsh.sh

# {{{ Setup environment

# Load $fg & co with color codes
autoload -U colors && colors

export PATH=$PATH:${HOME}/bin
export EDITOR=vim
# }}}

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# Local config
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local