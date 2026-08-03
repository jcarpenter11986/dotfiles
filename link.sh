#!/bin/bash

# The shebang selects Bash when this file is executed normally. This small,
# portable guard also handles an explicit invocation such as `zsh link.sh`.
if [ -z "${BASH_VERSION:-}" ]; then
    exec /bin/bash "$0" "$@"
fi

set -u

BASEDIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

install_git_repo() {
    local repository=$1
    local destination=$2
    local name=$3

    if [[ -d $destination/.git ]]; then
        printf 'Already installed: %s\n' "$name"
        return 0
    fi

    if [[ -e $destination || -L $destination ]]; then
        printf 'Cannot install %s: %s already exists and is not a Git clone\n' \
            "$name" "$destination" >&2
        return 1
    fi

    mkdir -p "$(dirname -- "$destination")"
    printf 'Installing %s...\n' "$name"
    git clone "$repository" "$destination"
}

link_item() {
    local source=$1
    local destination=$2

    [[ -e $source ]] || return 0

    if [[ -L $destination ]]; then
        if [[ $(readlink "$destination") == "$source" ]]; then
            printf 'Already linked: %s\n' "$destination"
            return 0
        fi

        printf 'Skipping %s (it is already a link to %s)\n' \
            "$destination" "$(readlink "$destination")" >&2
        return 1
    fi

    if [[ -e $destination ]]; then
        printf 'Skipping %s (a file or directory already exists there)\n' \
            "$destination" >&2
        return 1
    fi

    ln -s "$source" "$destination"
    printf 'Linked %s -> %s\n' "$destination" "$source"
}

exit_status=0

# Shell dependencies. These live outside the dotfiles repository so a fresh
# clone can initialize a complete Zsh setup without extra manual steps.
if ! command -v git >/dev/null 2>&1; then
    printf 'Cannot install shell dependencies: git is not available\n' >&2
    exit_status=1
else
    oh_my_zsh_dir=${ZSH:-"$HOME/.oh-my-zsh"}
    zsh_custom_dir=${ZSH_CUSTOM:-"$oh_my_zsh_dir/custom"}
    dracula_dir="$zsh_custom_dir/themes/dracula"
    autosuggestions_dir="$zsh_custom_dir/plugins/zsh-autosuggestions"

    if install_git_repo \
        'https://github.com/ohmyzsh/ohmyzsh.git' \
        "$oh_my_zsh_dir" \
        'Oh My Zsh'
    then
        install_git_repo \
            'https://github.com/dracula/zsh.git' \
            "$dracula_dir" \
            'Dracula for Zsh' || exit_status=1

        # Oh My Zsh looks for a custom theme at this exact path. Keeping the
        # clone in its own directory also keeps lib/async.zsh beside the theme.
        link_item \
            "$dracula_dir/dracula.zsh-theme" \
            "$zsh_custom_dir/themes/dracula.zsh-theme" || exit_status=1

        install_git_repo \
            'https://github.com/zsh-users/zsh-autosuggestions.git' \
            "$autosuggestions_dir" \
            'zsh-autosuggestions' || exit_status=1
    else
        exit_status=1
    fi
fi

# XDG config directories. Keep ~/.config itself so unrelated configuration can
# live alongside the directories managed by this repository.
mkdir -p "$HOME/.config"
for source in "$BASEDIR"/config/*; do
    [[ -e $source ]] || continue
    link_item "$source" "$HOME/.config/$(basename "$source")" || exit_status=1
done

# Vim
link_item "$BASEDIR/vimrc" "$HOME/.vimrc" || exit_status=1
link_item "$BASEDIR/vim" "$HOME/.vim" || exit_status=1

# Zsh
link_item "$BASEDIR/zshrc" "$HOME/.zshrc" || exit_status=1

# Git
link_item "$BASEDIR/gitconfig" "$HOME/.gitconfig" || exit_status=1

exit "$exit_status"
