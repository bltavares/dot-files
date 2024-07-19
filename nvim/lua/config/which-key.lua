local fn = vim.fn
local wk = require("which-key")
require("which-key").setup()

wk.add({
  { "<C-p>", "<Cmd>lua require('telescope.builtin').commands()<CR>", desc = "commands", remap = false },
})

-- TODO: git/fugitive keybindings
-- TODO: session keybindings
-- TODO: mode-mapping of localleader
-- TODO: dap-debug keybindings
-- TODO: access localleader maps over normal leader through m
wk.add({
  {
    {
      "<leader> ",
      "<Cmd>lua require('telescope.builtin').resume()<CR>",
      desc = "resume panel",
    },
    {
      "<leader>*",
      "<Cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>",
      desc = "find word in project",
    },
    {
      "<leader>/",
      "<Cmd>lua require('telescope.builtin').live_grep()<CR>",
      desc = "grep",
    },
    {
      "<leader>;",
      "<Cmd>CommentToggle<CR>",
      desc = "comment",
    },
  },
  {
    { "<leader>T", group = "toggle" },
    {
      "<leader>TI",
      "<Cmd>IlluminateToggle<CR>",
      desc = "Illuminate reference",
    },
    {
      "<leader>Ti",
      "<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
      desc = "Inlay hints",
    },
    {
      "<leader>Tr",
      "<Cmd>LspLensToggle<CR>",
      desc = "Fn references",
    },
    { "<leader>Tt", "<Cmd>Twilight<CR>", desc = "Twilight" },
    {
      "<leader>Tw",
      "<Cmd>IBLToggle<CR>",
      desc = "Whitespace marks (ident)",
    },
  },
  {
    { "<leader>b", group = "buffers" },
    { "<leader>bD", ":bufdo bd<CR>", desc = "do" },
    { "<leader>bb", "<Cmd>lua require('telescope.builtin').buffers()<CR>", desc = "buffers" },
  },
  {
    { "<leader>e", group = "editor" },
    { "<leader>ee", "<Cmd>e /Users/bruno.tavares/.config/nvim/plugin/01_general.lua<CR>", desc = "edit" },
    { "<leader>ep", "<Cmd>e /Users/bruno.tavares/.config/nvim/plugin/00_config.lua<CR>", desc = "plugins" },
    {
      "<leader>er",
      "<Cmd>luafile %<CR>",
      desc = "eval current lua file",
    },
  },
  {
    { "<leader>f", group = "find" },
    { "<leader>fb", "<Cmd>lua require('telescope.builtin').buffers()<CR>", desc = "buffers" },
  },
  {
    { "<leader>fc", group = "commands" },
    { "<leader>fcc", "<Cmd>lua require('telescope.builtin').commands()<CR>", desc = "commands" },
    { "<leader>fch", "<Cmd>lua require('telescope.builtin').command_history()<CR>", desc = "history" },
    { "<leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", desc = "files" },
  },
  {
    { "<leader>fg", group = "git" },
    { "<leader>fgb", "<Cmd>lua require('telescope.builtin').git_branches()<CR>", desc = "branches" },
    { "<leader>fgc", "<Cmd>lua require('telescope.builtin').git_bcommits()<CR>", desc = "bcommits" },
    { "<leader>fgg", "<Cmd>lua require('telescope.builtin').git_commits()<CR>", desc = "commits" },
    { "<leader>fgs", "<Cmd>lua require('telescope.builtin').git_status()<CR>", desc = "status" },
    { "<leader>fh", "<Cmd>lua require('telescope.builtin').help_tags()<CR>", desc = "help tags" },
    { "<leader>fq", "<Cmd>lua require('telescope.builtin').quickfix()<CR>", desc = "quickfix" },
  },
  {
    { "<leader>g", group = "git" },
    { "<leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", desc = "blame" },
    { "<leader>gg", "<Cmd>Gitsigns toggle_signs<CR>", desc = "signs" },
    { "<leader>gl", "<Cmd>GitLink<CR>", desc = "link" },
  },
  {
    { "<leader>p", group = "project" },
    { "<leader>p/", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", desc = "grep" },
    { "<leader>p?", "<Cmd>TodoTrouble<CR>", desc = "todos" },
    { "<leader>pT", "<Cmd>NvimTreeFindFile<CR>", desc = "show on tree" },
    { "<leader>pf", "<Cmd>lua require('telescope.builtin').find_files()<CR>", desc = "files" },
    { "<leader>pr", "<Cmd>NvimTreeRefresh<CR>", desc = "refresh tree" },
    { "<leader>ps", '<Cmd>lua require"telescope".extensions.projects.projects{}<CR>', desc = "switch" },
    { "<leader>pt", "<Cmd>NvimTreeToggle<CR>", desc = "project tree" },
  },
  {
    { "<leader>q", group = "vim" },
    { "<leader>qq", "<Cmd>qa!<CR>", desc = "Quit!" },
    { "<leader>qr", "<Cmd>luafile /Users/bruno.tavares/.config/nvim/init.lua<CR>", desc = "Reload" },
  },
  {
    { "<leader>t", group = "text" },
    { "<leader>t/", "<Cmd>CommentToggle<CR>", desc = "comment" },
  },
  {
    { "<leader>ta", group = "align" },
    { "<leader>ta(", "vi(<C-v>$:EasyAlign\\ g/^\\S/<CR>", desc = "()" },
    { "<leader>ta[", "vi[<C-v>$:EasyAlign\\ g/^\\S/<CR>", desc = "[]" },
    { "<leader>taa", "<PLUG>(EasyAlign)", desc = "interactive" },
    { "<leader>ta{", "vi{<C-v>$:EasyAlign\\ g/^\\S/<CR>", desc = "{}" },
  },
  {
    { "<leader>tl", group = "line" },
    { "<leader>tlj", "<Cmd>TSJJoin<CR>", desc = "join" },
    { "<leader>tll", "<Cmd>TSJToggle<CR>", desc = "toggle" },
    { "<leader>tls", "<Cmd>TSJSplit<CR>", desc = "split" },
  },
  {
    { "<leader>w", group = "window" },
    { "<leader>wc", "<C-w>c", desc = "close" },
    { "<leader>wh", "<C-w>h", desc = "move left" },
    { "<leader>wj", "<C-w>j", desc = "move down" },
    { "<leader>wk", "<C-w>k", desc = "move top" },
    { "<leader>wl", "<C-w>l", desc = "move right" },
    { "<leader>wm", "<Cmd>only<CR>", desc = "maximize split" },
    { "<leader>ws", "<Cmd>split<CR>", desc = "horizontal split" },
  },
  {
    { "<leader>wt", group = "tab" },
    { "<leader>wtc", ":tabclose<CR>", desc = "close" },
    { "<leader>wtn", ":tabnew<CR>", desc = "new" },
    { "<leader>wtt", ":tabnext<CR>", desc = "next" },
    { "<leader>wv", "<Cmd>vsplit<CR>", desc = "vertical split" },
  },
})

if vim.g.neovide then
  wk.add({
    { "<leader>Tf", group = "font" },
    { "<leader>Tf+", "<CMD>lua FontIncrease()<CR>", desc = "+" },
    { "<leader>Tf-", "<CMD>lua FontDecrease()<CR>", desc = "-" },
    { "<leader>Tf0", "<CMD>lua FontReset()<CR>", desc = "reset" },
  })
end

wk.add({
  mode = { "v" },
  { "<leader>/", ":CommentToggle<cr>", desc = "comment" },
  {
    { "<leader>g", group = "git" },
    { "<leader>gl", "<Cmd>GitLink<CR>", desc = "git link" },
  },
  {
    { "<leader>t", group = "text" },
  },
  {
    { "<leader>ta", group = "align" },
    { "<leader>ta(", ":EasyAlign\\ g/^\\S/<CR>", desc = "()" },
    { "<leader>ta,", ":Tabularize /,<CR>", desc = "," },
    { "<leader>ta-", ":Tabularize /-<CR>", desc = "-" },
    { "<leader>ta=", ":Tabularize /=<CR>", desc = "=" },
    { "<leader>ta[", ":EasyAlign\\ g/^\\S/<CR>", desc = "[]" },
    { "<leader>taa", "<PLUG>(EasyAlign)", desc = "interactive" },
    { "<leader>ta{", ":EasyAlign\\ g/^\\S/<CR>", desc = "{}" },
    { "<leader>ta|", ":Tabularize /|<CR>", desc = "|" },
  },
})

wk.add({
  { "<localleader>=", "gg=G``", desc = "format", remap = false },
  {
    { "<localleader>t", group = "test", remap = false },
    { "<localleader>tO", "<Cmd>Neotest output-panel<CR>", desc = "output", remap = false },
    { "<localleader>tf", "<Cmd>Neotest run file<CR>", desc = "file", remap = false },
    { "<localleader>tl", "<Cmd>Neotest run last<CR>", desc = "last", remap = false },
    { "<localleader>to", "<Cmd>Neotest output<CR>", desc = "output", remap = false },
    { "<localleader>ts", "<Cmd>Neotest summary<CR>", desc = "summary", remap = false },
    { "<localleader>tt", "<Cmd>Neotest run<CR>", desc = "nearest", remap = false },
  },
})
