local bg_group = vim.api.nvim_create_augroup("SetTermBgGroup", {
    clear = true,
})

-- Change background when Neovim enters or colorscheme updates
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
    group = bg_group,
    callback = function()
        local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
        if normal_hl and normal_hl.bg then
            local hex_color = string.format("#%06x", normal_hl.bg)
            -- Send OSC 11 escape sequence to change the terminal's background color
            io.write(string.format("\027]11;%s\027\\", hex_color))
            -- io.flush()
        end
    end,
})

-- Restore default background color when Neovim exits
vim.api.nvim_create_autocmd("VimLeavePre", {
    group = bg_group,
    callback = function()
        if vim.env.PSModulePath then
            -- Powershell doesn't implement OSC 111
            io.write "\027]11;#0c0c0c\027\\"
        else
            -- OSC 111 resets the background color back to default
            io.write "\027]111\027\\"
        end
        -- io.flush()
    end,
})
