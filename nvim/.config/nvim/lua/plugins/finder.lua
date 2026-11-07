-- Fuzzy finder. Lists files with fd/rg, which walk into git submodules.
-- Needs fzf and ripgrep installed.
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Search text in project" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Open buffers" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help pages" },
  },
  opts = {},
}
