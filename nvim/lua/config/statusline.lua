local function LspStatus()
  local names = vim.tbl_map(function(server)
    return server.name
  end, vim.lsp.get_clients({ bufnr = 0 }))

  return #names > 0 and "%#Conditional#" .. "[✔ " .. table.concat(names, " ") .. "]" or ""
end


local TreeSitter = function()
    return require("nvim-treesitter").statusline(45) or ""
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
            {"diagnostics", sources = {"nvim_diagnostic"}}, "encoding", "fileformat",
            "filetype"
        },
        lualine_y = {"location"},
        lualine_z = {LspStatus},
    }
}
