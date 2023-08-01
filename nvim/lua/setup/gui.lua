if vim.g.neovide then
    vim.g.neovide_cursor_vfx_mode = "wireframe" -- noevide nonsense

    local font_size = 16
    local step = 1;
    -- local font = "CaskaydiaCove Nerd Font Mono"
    -- local font = "JetBrainsMono Nerd Font Mono"
    local font = "FiraCode Nerd Font Mono"
    vim.o.guifont = font .. ":h" .. font_size

    _G.FontIncrease = function ()
        font_size = font_size + step
        vim.o.guifont = font .. ":h" .. font_size
    end

    _G.FontDecrease = function ()
        font_size = font_size - step
        vim.o.guifont = font .. ":h" .. font_size
    end

    _G.FontReset = function ()
        font_size = 16
        vim.o.guifont = font .. ":h" .. font_size
    end
end
