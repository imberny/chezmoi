return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
	sort = { "local", "order", "group", "alphanum", "mod" },
  },
  config = function() -- I couldn't find a way to add group labels in keys or opts
    local wk = require "which-key"
    wk.add {
      { "<leader>b", group = "buffer" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
	  { "<leader>l", group = "lsp" },
      { "<leader>s", group = "search" },
      { "<leader>u", group = "ui" },
      { "<leader>x", group = "diagnostics" },
    }
  end,
  keys = {
    {
      "<leader>?",
      function() require("which-key").show { global = false } end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
