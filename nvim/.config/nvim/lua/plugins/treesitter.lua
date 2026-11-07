-- Syntax parsers. Highlighting itself is started in config/autocmds.lua.
-- Needs a C compiler and the tree-sitter CLI to build parsers.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "bash", "c", "cpp", "css", "diff", "html", "javascript", "json",
      "lua", "markdown", "markdown_inline", "python", "tsx", "typescript",
      "vim", "vimdoc", "yaml",
    })
  end,
}
