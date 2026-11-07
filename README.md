# dotfiles

My terminal setup on Windows + WSL2 (Ubuntu): **Neovim**, **tmux**, **zsh**
and a few small scripts. It's built around one workflow: `dev` opens a tmux
session for a project with the editor in one pane, and everything else stays
in the terminal.

Managed with [GNU Stow](https://www.gnu.org/software/stow/), so every file
here is symlinked into place and editing the live config edits the repo.

## What's inside

| Package   | Installs to                       | What it is |
|-----------|-----------------------------------|------------|
| `nvim`    | `~/.config/nvim/`                 | Neovim config: Lua, lazy.nvim, LSP, my own colorscheme |
| `tmux`    | `~/.config/tmux/`                 | `Ctrl-Space` prefix, vim keys, copy to the Windows clipboard |
| `zsh`     | `~/.zshrc`                        | oh-my-zsh, prompt, aliases |
| `git`     | `~/.gitconfig`, `~/.config/git/`  | Identity and global ignores |
| `scripts` | `~/.local/bin/`                   | `dev`, `auto` (below) |

### Neovim

Lua config for Neovim 0.12, with plugins managed by
[lazy.nvim](https://github.com/folke/lazy.nvim). `lazy-lock.json` pins every
plugin version.

```
nvim/.config/nvim/
├── init.lua              # entry point
├── colors/               # yomi + yomi-light
└── lua/
    ├── config/           # options, keymaps, autocmds, lazy bootstrap
    └── plugins/          # one file per area
```

| Area        | Plugins |
|-------------|---------|
| LSP         | nvim-lspconfig, mason + mason-lspconfig + mason-tool-installer, lazydev |
| Completion  | blink.cmp |
| Formatting  | conform.nvim |
| Syntax      | nvim-treesitter |
| Finding     | fzf-lua |
| File tree   | neo-tree |
| Git         | gitsigns, diffview |

The colorscheme is [**yomi**](https://github.com/AndrewFila/yomi), which I
also made.

### Scripts

- **`dev [session] [dir]`** opens or attaches to a tmux session for a project,
  with the editor pane ready. Run it inside tmux to switch sessions instead of
  nesting.
- **`auto <name> [description]`** creates a new executable bash script with a
  figlet banner header.

## Install

```sh
sudo apt install stow
git clone git@github.com:AndrewFila/dotfiles.git ~/dotfiles
~/dotfiles/install.sh            # all packages
~/dotfiles/install.sh nvim tmux  # or just some
```

If a real file is already where Stow wants to put a link, Stow stops and
lists the conflicts. Move those files aside and run it again.

To update a machine later, run `~/dotfiles/install.sh --update`. It pulls,
checks for conflicts before touching anything, and then re-links. Editing
files that already exist needs only `git pull`.

## Local overrides

`~/.zshrc` sources `~/.zshrc.local` if it exists. Machine-specific or
private settings (hosts, tokens, work aliases) go there, and it's never
committed.
