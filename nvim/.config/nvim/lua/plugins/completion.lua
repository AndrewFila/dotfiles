-- Completion popup fed by the LSP, file paths, snippets and buffer words.
return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  opts = {
    -- "enter" preset: Enter accepts, Ctrl-n / Ctrl-p (or arrows) move,
    -- Ctrl-e closes, Ctrl-Space opens the menu manually.
    keymap = { preset = "enter" },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 300 },
      -- The first item is preselected, so Enter accepts it (as in VS Code).
      -- Set preselect = false if you'd rather Enter insert a newline until
      -- you've moved onto an item.
      list = { selection = { preselect = true, auto_insert = false } },
    },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
  },
}
