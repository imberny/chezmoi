if vim.env.TERM and vim.env.TERM:match "kitty" then
    -- Sync Kitty background color with Neovim's current background
    local function sync_kitty_bg()
        -- Extract normal highlight background color in HEX format
        local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
        if normal_hl and normal_hl.bg then
            local hex_color = string.format("#%06x", normal_hl.bg)
            -- Send OSC 11 escape sequence to change Kitty's background color
            io.write(string.format("\027]11;%s\027\\", hex_color))
        end
    end

    -- Change background when Neovim enters or colorscheme updates
    vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
        group = kitty_bg_group,
        callback = sync_kitty_bg,
    })

    -- Restore default Kitty background color when Neovim exits
    vim.api.nvim_create_autocmd("VimLeavePre", {
        group = kitty_bg_group,
        callback = function()
            -- OSC 111 resets the background color back to kitty.conf default
            io.write "\027]111\027\\"
        end,
    })
end
