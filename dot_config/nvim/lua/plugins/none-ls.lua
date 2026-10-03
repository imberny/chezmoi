-- Customize None-ls sources

---@type LazySpec
return {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
        -- opts variable is the default configuration table for the setup function call
        local null_ls = require "null-ls"
        null_ls.setup {
            debug = true,
            sources = {
                -- Set linter
                null_ls.builtins.diagnostics.selene,
                null_ls.builtins.diagnostics.gdlint,
                null_ls.builtins.diagnostics.gitlint,
                null_ls.builtins.diagnostics.pylint,
                -- Set a formatter
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.gdformat,
                null_ls.builtins.formatting.prettier,
                -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
            },
        }

        -- Check supported formatters and linters
        -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

        -- Only insert new sources, do not replace the existing ones
        -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    end,
}
