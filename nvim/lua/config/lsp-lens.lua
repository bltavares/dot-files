require("lsp-lens").setup({
  sections = {
    git_authors = function(latest_author, count)
      return "▸ " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
    end,
  },
})
