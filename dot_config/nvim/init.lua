-- -- Install third-party plugins via "vim.pack.add()".
-- vim.pack.add({
-- -- Quickstart configs for LSP
-- 'https://github.com/neovim/nvim-lspconfig',
-- -- Fuzzy picker
-- 'https://github.com/ibhagwan/fzf-lua',
-- -- Autocompletion
-- 'https://github.com/nvim-mini/mini.completion',
-- -- Enhanced quickfix/loclist
-- 'https://github.com/stevearc/quicker.nvim',
-- -- Git integration
-- 'https://github.com/lewis6991/gitsigns.nvim',
-- -- icons
-- { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
-- })

require "config"
require "autocmds"
-- require('fzf-lua').setup { fzf_colors = true }
-- require('mini.completion').setup {}
-- require('quicker').setup {}
-- require('gitsigns').setup {}
-- require("everforest").load()
require("lualine").setup {
    options = {
        -- ... other configuration
        theme = "everforest", -- Can also be "auto" to detect automatically.
    },
}
