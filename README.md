# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level
directory is a package that mirrors its layout under `$HOME`.

| Package   | Installs to                 |
|-----------|-----------------------------|
| `git`     | `~/.gitconfig`, `~/.config/git/` |
| `nvim`    | `~/.config/nvim/`           |
| `scripts` | `~/.local/bin/`             |
| `tmux`    | `~/.config/tmux/`           |
| `zsh`     | `~/.zshrc`                  |

## Install

```sh
sudo apt install stow
git clone <repo-url> ~/dotfiles
~/dotfiles/install.sh            # all packages
~/dotfiles/install.sh nvim tmux  # or just some
```

## Local overrides

`~/.zshrc` sources `~/.zshrc.local` if it exists. Put machine-specific or
private settings (hosts, tokens, work aliases) there — it is not tracked.
