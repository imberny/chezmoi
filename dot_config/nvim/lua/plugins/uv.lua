return {
    "benomahony/uv.nvim",
    -- Optional filetype to lazy load when you open a python file
    ft = "python",
    -- Optional dependency, but recommended:
    dependencies = {
        "folke/snacks.nvim",
        -- or
        --   "nvim-telescope/telescope.nvim"
    },
    opts = function(_, opts)
        opts.spec = opts.spec or {}
        local wk = require "which-key"
        wk.add {
            { "<leader>p", mode = { "n", "v" }, group = "python", icon = { cat = "filetype", name = "python" } },
        }

        opts.picker_integration = true
        opts.keymaps = false
    end,
    keys = {
        {
            "<leader>pp",
            "<cmd>lua Snacks.picker.pick('uv_commands')<CR>",
            desc = "uv commands panel",
            ft = "python",
        },
        {
            "<leader>pr",
            "<cmd>UVRunFile<cr>",
            desc = "uv run file",
            ft = "python",
        },
        {
            "<leader>ps",
            mode = { "n", "v" },
            ":<C-u>UVRunSelection<cr>",
            desc = "uv run selection",
            ft = "python",
        },
        {
            "<leader>pf",
            "<cmd>UVRunFunction<cr>",
            desc = "uv run function",
            ft = "python",
        },
        {
            "<leader>pe",
            "<cmd>lua Snacks.picker.pick('uv_venv')<cr>",
            desc = "uv environment",
            ft = "python",
        },
        {
            "<leader>pi",
            "<cmd>UVInit<cr>",
            desc = "uv init",
            ft = "python",
        },
        {
            "<leader>pa",
            "<cmd>lua vim.ui.input({prompt = 'Enter package name: '}, function(input) if input and input ~= '' then require('uv').run_command('uv add ' .. input) end end)<cr>",
            desc = "uv add",
            ft = "python",
        },
        {
            "<leader>pd",
            "<cmd>lua require('uv').remove_package()<cr>",
            desc = "uv remove package",
            ft = "python",
        },
        {
            "<leader>py",
            "<cmd>lua require('uv').run_command('uv sync')<cr>",
            desc = "uv sync packages",
            ft = "python",
        },
        {
            "<leader>pY",
            "<cmd>lua require('uv').run_command('uv sync --all-extras --all-packages --all-groups')<CR>",
            desc = "UV Sync All Extras, Groups and Packages",
            ft = "python",
        },
        -- prefix = "<leader>p", -- Main prefix for uv commands
        -- commands = true,       -- Show uv commands menu (<leader>x)
        -- run_file = true,       -- Run current file (<leader>xr)
        -- run_selection = true,  -- Run selected code (<leader>xs)
        -- run_function = true,   -- Run function (<leader>xf)
        -- venv = true,           -- Environment management (<leader>xe)
        -- init = true,           -- Initialize uv project (<leader>xi)
        -- add = true,            -- Add a package (<leader>xa)
        -- remove = true,         -- Remove a package (<leader>xd)
        -- sync = true,           -- Sync packages (<leader>xc)
        -- sync_all = true,       -- Sync all packages, extras and groups (<leader>xC)
    },
}
