-- Leader key: Space. Change these two lines if you prefer another key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Hybrid line numbers: absolute on the current line, relative elsewhere
opt.number = true
opt.relativenumber = true

opt.termguicolors = true   -- 24-bit color, needed for the color scheme
opt.signcolumn = "yes"     -- always reserve the gutter so git markers don't shift text
opt.colorcolumn = ""       -- no column guide

-- Search
opt.ignorecase = true
opt.smartcase = true       -- case-sensitive only when the pattern has capitals

-- Splits open where you'd expect
opt.splitright = true
opt.splitbelow = true

-- Indentation defaults; the formatters have the final say on save
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.undofile = true        -- undo history survives closing the file
opt.autoread = true        -- reload files changed on disk (see autocmds.lua)
opt.updatetime = 250       -- faster CursorHold, used by git markers and autoread
opt.scrolloff = 4

-- Diagnostics: underline only. No end-of-line text, no gutter signs.
-- <leader>d shows the message for the current line (see keymaps.lua).
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = true,
  severity_sort = true,
  float = { border = "rounded", source = true },
})
