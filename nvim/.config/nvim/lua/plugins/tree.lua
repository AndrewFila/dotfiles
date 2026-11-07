-- File tree sidebar. Opened at startup by config/autocmds.lua.
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- icons; needs a Nerd Font in the terminal
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
  },
  opts = {
    close_if_last_window = true, -- :q on the last file also closes the tree
    filesystem = {
      follow_current_file = { enabled = true },
    },
  },
}
