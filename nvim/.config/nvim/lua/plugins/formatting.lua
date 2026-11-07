-- Format on save. Falls back to the language server's formatter when no
-- tool is listed for a filetype.
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      python = { "ruff_format" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      lua = { "stylua" },
    },
    format_on_save = { timeout_ms = 2000, lsp_format = "fallback" },
  },
}
