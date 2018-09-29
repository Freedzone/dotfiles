#!/bin/bash

DOTS_BACKUP='.dotbackup' # backup folder
DOTS_CFG='.dotcfg' # repo work dir
DOTS_URL='https://github.com/Freedzone/dotfiles.git'

cd $HOME

# install dots
mkdir -p $DOTS_CFG
git clone --bare --recursive $DOTS_URL $DOTS_CFG # clone with submodules

# for quick access
dots="/usr/bin/git --git-dir=$DOTS_CFG --work-tree=. $@"

if $dots checkout; then
    echo "Checkout complete. No collisions.";
else
    echo "Backing up existing dot files.";
    mkdir -p $DOTS_BACKUP
    $dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
        xargs -I {} bash -c \
            "mkdir -p \$(dirname $DOTS_BACKUP/{}); mv {} $DOTS_BACKUP/{}"

    echo "Checkout..."
    if ! $dots checkout; then
        echo "Something wrong..."
        exit 1
    fi
    echo "Done!"
fi;

$dots submodule update --recursive # update submodules
$dots config status.showUntrackedFiles no

# zsh is installed
if command -v zsh >/dev/null 2>&1; then
    # install oh-my-zsh
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    # no need to back up as it is oh-my-zsh ready
    mv .zshrc.pre-oh-my-zsh .zshrc
fi
