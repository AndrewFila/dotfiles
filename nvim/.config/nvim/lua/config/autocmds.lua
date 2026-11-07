local autocmd = vim.api.nvim_create_autocmd

-- Start Treesitter highlighting when a parser exists for the filetype.
-- pcall skips filetypes without one (neo-tree, plain text, etc.).
autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- Pick up files changed on disk by something else (e.g. an AI agent in
-- another tmux pane). Needs `set -g focus-events on` in tmux.conf.
autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  callback = function()
    if vim.fn.mode() ~= "c" and vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})

-- Open the file tree when Neovim starts without a file argument.
autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("Neotree show")
    end
  end,
})
