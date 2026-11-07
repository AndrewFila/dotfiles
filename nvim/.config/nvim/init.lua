-- Entry point. Options come first because the leader key must be set
-- before any plugin defines a <leader> mapping.
require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")

vim.cmd.colorscheme("yomi") -- colors/yomi.vim; use "yomi-light" for the light variant
