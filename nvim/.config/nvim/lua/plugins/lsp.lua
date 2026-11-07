-- Language servers and formatters.
--   mason                 downloads the tools into Neovim's data folder
--   mason-tool-installer  makes sure everything in the list below is installed
--   mason-lspconfig       turns on every installed server automatically,
--                         using the server configs from nvim-lspconfig
return {
  { "mason-org/mason.nvim", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        -- language servers
        "clangd",                     -- C / C++
        "typescript-language-server", -- TypeScript / JavaScript
        "pyright",                    -- Python
        "bash-language-server",       -- shell scripts
        "lua-language-server",        -- Lua (this config)
        -- formatters and linters
        "clang-format", "prettier", "ruff", "shfmt", "stylua", "shellcheck",
      },
    },
  },
  {
    -- Teaches lua-language-server about the `vim` global in this config
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
}
