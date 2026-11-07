local map = vim.keymap.set

-- Diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic for this line" })

-- LSP. Neovim already provides: K (hover), grn (rename), gra (code action),
-- grr (references), gri (implementation), [d and ]d (prev/next diagnostic).
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>")
