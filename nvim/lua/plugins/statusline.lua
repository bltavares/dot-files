local lsp_status = require("lsp-status")
local LspStatus = function()
    if #vim.lsp.buf_get_clients() > 0 then return lsp_status.status() end
    return ""
end

local TreeSitter = function()
    return require("nvim-treesitter").statusline() or ""
end

require("lualine").setup {
    options = {
        theme = "tokyonight",
        icons_enabled = false,
        section_separators = "",
        component_separators = ""
    },
    extensions = {"quickfix", "nvim-tree"},
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {{"filename", file_status = true}},
        lualine_x = {
            TreeSitter,
            {"diagnostics", sources = {"nvim_lsp"}}, "encoding", "fileformat",
            "filetype"
        },
        lualine_y = {"location"},
        lualine_z = {LspStatus},
    }
}
