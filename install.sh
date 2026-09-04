#!/usr/bin/env bash
# Deploy this repo's dotfiles into $HOME via symlinks.
#
# Safe to re-run: existing correct symlinks are left alone, and any existing
# regular file at a target path is backed up to <name>.bak.<timestamp>
# before being replaced.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d%H%M%S)"

echo "Repo:   $REPO_DIR"
echo "Target: $HOME"

link() {
    local src="$1" dst="$2"

    if [ ! -e "$src" ]; then
        echo "SKIP    $dst (missing source $src)"
        return
    fi

    if [ -L "$dst" ]; then
        if [ "$(readlink "$dst")" = "$src" ]; then
            echo "OK      $dst"
            return
        fi
        rm "$dst"
    elif [ -e "$dst" ]; then
        mv "$dst" "$dst.bak.$STAMP"
        echo "BACKUP  $dst -> $dst.bak.$STAMP"
    fi

    ln -s "$src" "$dst"
    echo "LINK    $dst -> $src"
}

link "$REPO_DIR/bashrc"               "$HOME/.bashrc"
link "$REPO_DIR/commands"             "$HOME/.commands"
link "$REPO_DIR/fzf_bindings.bash"    "$HOME/.fzf_bindings.bash"
link "$REPO_DIR/fzf_completion.bash"  "$HOME/.fzf_completion.bash"
link "$REPO_DIR/tmux.conf"            "$HOME/.tmux.conf"
link "$REPO_DIR/screenrc"             "$HOME/.screenrc"
link "$REPO_DIR/neodocker.rc"         "$HOME/.neodocker.rc"
link "$REPO_DIR/pureline.conf"        "$HOME/.pureline.conf"

echo "Done."
