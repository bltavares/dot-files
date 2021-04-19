local M = {};

M.set_keymap = function(mode, opts, keymaps)
    for _, keymap in ipairs(keymaps) do
        vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
    end
end

M.buf_set_keymap = function(bufnr, mode, opts, keymaps)
    for _, keymap in ipairs(keymaps) do
        vim.api.nvim_buf_set_keymap(bufnr, mode, keymap[1], keymap[2], opts)
    end
end

return M;
