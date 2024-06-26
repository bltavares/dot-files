local fn = vim.fn
local wk = require("which-key")
require("which-key").setup()

wk.register(
  { ["<C-p>"] = { "<Cmd>lua require('telescope.builtin').commands()<CR>", "commands" } },
  { silent = true, noremap = true, mode = "n" }
)

-- TODO: git/fugitive keybindings
-- TODO: session keybindings
-- TODO: mode-mapping of localleader
-- TODO: dap-debug keybindings
-- TODO: access localleader maps over normal leader through m
local keymap = {
  [" "] = { "<Cmd>lua require('telescope.builtin').resume()<CR>", "resume panel" },
  [";"] = { "<Cmd>CommentToggle<CR>", "comment" },
  ["/"] = { "<Cmd>lua require('telescope.builtin').live_grep()<CR>", "grep" },
  ["*"] = {
    "<Cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('()<cword>') }<CR>",
    "find word in project",
  },
  q = {
    name = "+vim",
    q = { "<Cmd>qa!<CR>", "Quit!" },
    r = {
      "<Cmd>luafile " .. fn.stdpath("config") .. "/init.lua<CR>",
      "Reload",
    },
  },
  e = {
    name = "+editor",
    e = { "<Cmd>e " .. fn.stdpath("config") .. "/plugin/01_general.lua<CR>", "edit" },
    p = {
      "<Cmd>e " .. fn.stdpath("config") .. "/plugin/00_config.lua<CR>",
      "plugins",
    },
    r = { "<Cmd>luafile %<CR>", "eval current lua file" },
  },
  b = {
    name = "+buffers",
    b = { "<Cmd>lua require('telescope.builtin').buffers()<CR>", "buffers" },
    D = { ":bufdo bd<CR>", "do" },
  },
  f = {
    name = "+find",
    f = { "<Cmd>lua require('telescope.builtin').find_files()<CR>", "files" },
    b = { "<Cmd>lua require('telescope.builtin').buffers()<CR>", "buffers" },
    h = { "<Cmd>lua require('telescope.builtin').help_tags()<CR>", "help tags" },
    c = {
      name = "+commands",
      c = { "<Cmd>lua require('telescope.builtin').commands()<CR>", "commands" },
      h = { "<Cmd>lua require('telescope.builtin').command_history()<CR>", "history" },
    },
    q = { "<Cmd>lua require('telescope.builtin').quickfix()<CR>", "quickfix" },
    g = {
      name = "+git",
      g = { "<Cmd>lua require('telescope.builtin').git_commits()<CR>", "commits" },
      c = { "<Cmd>lua require('telescope.builtin').git_bcommits()<CR>", "bcommits" },
      b = { "<Cmd>lua require('telescope.builtin').git_branches()<CR>", "branches" },
      s = { "<Cmd>lua require('telescope.builtin').git_status()<CR>", "status" },
    },
  },
  p = {
    name = "+project",
    s = {
      '<Cmd>lua require"telescope".extensions.projects.projects{}<CR>',
      "switch",
    },
    t = { "<Cmd>NvimTreeToggle<CR>", "project tree" },
    T = { "<Cmd>NvimTreeFindFile<CR>", "show on tree" },
    r = { "<Cmd>NvimTreeRefresh<CR>", "refresh tree" },
    f = { "<Cmd>lua require('telescope.builtin').find_files()<CR>", "files" },
    ["/"] = { "<Cmd>lua require('telescope.builtin').live_grep()<CR>", "grep" },
    ["?"] = { "<Cmd>TodoTrouble<CR>", "todos" },
  },
  w = {
    name = "+window",
    v = { "<Cmd>vsplit<CR>", "vertical split" },
    s = { "<Cmd>split<CR>", "horizontal split" },
    m = { "<Cmd>only<CR>", "maximize split" },
    h = { "<C-w>h", "move left" },
    j = { "<C-w>j", "move down" },
    k = { "<C-w>k", "move top" },
    l = { "<C-w>l", "move right" },
    c = { "<C-w>c", "close" },
    t = {
      name = "+tab",
      t = { ":tabnext<CR>", "next" },
      n = { ":tabnew<CR>", "new" },
      c = { ":tabclose<CR>", "close" },
    },
  },
  g = {
    name = "+git",
    l = { "<Cmd>GitLink<CR>", "link" },
    b = { "<Cmd>Gitsigns toggle_current_line_blame<CR>", "blame" },
    g = { "<Cmd>Gitsigns toggle_signs<CR>", "signs" },
  },
  T = {
    name = "+toggle",
    t = { "<Cmd>Twilight<CR>", "Twilight" },
    i = { "<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", "Inlay hints" },
    I = { "<Cmd>IlluminateToggle<CR>", "Illuminate reference" },
    r = { "<Cmd>LspLensToggle<CR>", "Fn references" },
    w = { "<Cmd>IBLToggle<CR>", "Whitespace marks (ident)" },
    -- z = {"<Cmd>TZAtaraxis<CR>", "zen"},
  },
  t = {
    name = "+text",
    ["/"] = { "<Cmd>CommentToggle<CR>", "comment" },
    l = {
      name = "+line",
      l = { "<Cmd>TSJToggle<CR>", "toggle" },
      s = { "<Cmd>TSJSplit<CR>", "split" },
      j = { "<Cmd>TSJJoin<CR>", "join" },
    },
    a = {
      name = "+align",
      a = { "<PLUG>(EasyAlign)", "interactive" },
      ["{"] = { "vi{<C-v>$:EasyAlign\\ g/^\\S/<CR>", "{}" },
      ["["] = { "vi[<C-v>$:EasyAlign\\ g/^\\S/<CR>", "[]" },
      ["("] = { "vi(<C-v>$:EasyAlign\\ g/^\\S/<CR>", "()" },
    },
  },
}
wk.register(keymap, { prefix = "<leader>" })

if vim.g.neovide then
  local gui_keymap = {
    T = {
      f = {
        name = "+font",
        ["+"] = { "<CMD>lua FontIncrease()<CR>", "+" },
        ["-"] = { "<CMD>lua FontDecrease()<CR>", "-" },
        ["0"] = { "<CMD>lua FontReset()<CR>", "reset" },
      },
    },
  }
  wk.register(gui_keymap, { prefix = "<leader>" })
end

local visual_keymap = {
  ["/"] = { ":CommentToggle<cr>", "comment" },
  t = {
    name = "+text",
    a = {
      name = "+align",
      a = { "<PLUG>(EasyAlign)", "interactive" },
      [","] = { ":Tabularize /,<CR>", "," },
      ["-"] = { ":Tabularize /-<CR>", "-" },
      ["|"] = { ":Tabularize /|<CR>", "|" },
      ["="] = { ":Tabularize /=<CR>", "=" },
      ["{"] = { ":EasyAlign\\ g/^\\S/<CR>", "{}" },
      ["["] = { ":EasyAlign\\ g/^\\S/<CR>", "[]" },
      ["("] = { ":EasyAlign\\ g/^\\S/<CR>", "()" },
    },
  },
  g = { name = "+git", l = { "<Cmd>GitLink<CR>", "git link" } },
  -- T = {name="+toggle",
  --   z = {"<Cmd>TZNarrow<CR>", "Narrow"},
  -- },
}
wk.register(visual_keymap, { mode = "v", prefix = "<leader>" })

local localkeymap = {
  ["="] = { "gg=G``", "format" },
  t = {
    name = "+test",
    t = { "<Cmd>Neotest run<CR>", "nearest" },
    f = { "<Cmd>Neotest run file<CR>", "file" },
    l = { "<Cmd>Neotest run last<CR>", "last" },
    s = { "<Cmd>Neotest summary<CR>", "summary" },
    o = { "<Cmd>Neotest output<CR>", "output" },
    O = { "<Cmd>Neotest output-panel<CR>", "output" },
  },
}
wk.register(localkeymap, {
  prefix = "<localleader>",
  silent = true,
  noremap = true,
  mode = "n",
})
