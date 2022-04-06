local fn = vim.fn
local wk = require('which-key')
require'which-key'.setup()

wk.register({['<C-p>'] = {"<Cmd>lua require('telescope.builtin').commands()<CR>", "commands"}},
{silent = true, noremap = true, mode = "n"});

-- TODO: git/fugitive keybindings
-- TODO: session keybindings
-- TODO: mode-mapping of localleader
-- TODO: dap-debug keybindings
-- TODO: access localleader maps over normal leader through m
local keymap = {
  [";"] = {"<Cmd>CommentToggle<CR>", "comment"},
  ["/"] = {"<Cmd>lua require('telescope.builtin').live_grep()<CR>", 'grep'},
  ["*"] = {
    "<Cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('()<cword>') }<CR>",
    'find word in project'
  },
  q = {
    name = "+vim",
    q = {'<Cmd>qa!<CR>', 'Quit!'},
    r = {
      '<Cmd>luafile ' .. fn.stdpath('config') .. '/init.lua<CR>', 'Reload'
    }
  },
  e = {
    name = "+editor",
    e = {'<Cmd>e ' .. fn.stdpath('config') .. '/plugin/01_general.lua<CR>', 'edit'},
    p = {
      '<Cmd>e ' .. fn.stdpath('config') .. '/plugin/00_plugins.lua<CR>',
      'plugins'
    },
    r = {'<Cmd>luafile %<CR>', 'eval current lua file'}
  },
  b = {
    name = "+buffers",
    b = {"<Cmd>lua require('telescope.builtin').buffers()<CR>", 'buffers'},
    D = {':bufdo bd<CR>', 'do'}
  },
  f = {
    name = '+find',
    f = {"<Cmd>lua require('telescope.builtin').find_files()<CR>", "files"},
    b = {"<Cmd>lua require('telescope.builtin').buffers()<CR>", 'buffers'},
    h = {"<Cmd>lua require('telescope.builtin').help_tags()<CR>", 'help tags'},
    c = {
      name = '+commands',
      c = {"<Cmd>lua require('telescope.builtin').commands()<CR>", 'commands'},
      h = {"<Cmd>lua require('telescope.builtin').command_history()<CR>", 'history'}
    },
    q = {"<Cmd>lua require('telescope.builtin').quickfix()<CR>", 'quickfix'},
    g = {
      name = '+git',
      g = {"<Cmd>lua require('telescope.builtin').git_commits()<CR>", 'commits'},
      c = {"<Cmd>lua require('telescope.builtin').git_bcommits()<CR>", 'bcommits'},
      b = {"<Cmd>lua require('telescope.builtin').git_branches()<CR>", 'branches'},
      s = {"<Cmd>lua require('telescope.builtin').git_status()<CR>", 'status'}
    }
  },
  p = {
    name = "+project",
    s = {
      '<Cmd>lua require"telescope".extensions.project.project{ display_type = "full" }<CR>',
      "switch"
    },
    a = {'<Cmd>lua project_add_cwd()<CR>', 'add project'},
    A = {'<Cmd>lua project_add_cwd(vim.loop.cwd())<CR>', 'add current pwd'},
    t = {'<Cmd>NvimTreeToggle<CR>', 'project tree'},
    T = {'<Cmd>NvimTreeFindFile<CR>', 'show on tree'},
    r = {'<Cmd>NvimTreeRefresh<CR>', 'refresh tree'},
    f = {"<Cmd>lua require('telescope.builtin').find_files()<CR>", 'files'},
    ["/"] = {"<Cmd>lua require('telescope.builtin').live_grep()<CR>", 'grep'},
    ["?"] = {'<Cmd>TodoTrouble<CR>', 'todos'}
  },
  w = {
    name = "+window",
    v = {'<Cmd>vsplit<CR>', 'vertical split'},
    s = {'<Cmd>split<CR>', 'horizontal split'},
    m = {'<Cmd>only<CR>', 'maximize split'},
    h = {'<C-w>h', 'move left'},
    j = {'<C-w>j', 'move down'},
    k = {'<C-w>k', 'move top'},
    l = {'<C-w>l', 'move right'},
    c = {'<C-w>c', 'close'},
    t = {
      name = "+tab",
      t = {":tabnext<CR>", "next"},
      n = {":tabnew<CR>", "new"},
      c = {":tabclose<CR>", "close"}
    }
  },
  T = {name = "+toggle", t = {"<Cmd>Twilight<CR>", "Twilight"}},
  t = {name = "+text",
    ["/"] = {"<Cmd>CommentToggle<CR>", "comment"},
    a = {
      name = "+align",
      ["{"] = {"vi{<C-v>$:EasyAlign\\ g/^\\S/<CR>", "{}"},
      ["["] = {"vi[<C-v>$:EasyAlign\\ g/^\\S/<CR>", "[]"},
      ["("] = {"vi(<C-v>$:EasyAlign\\ g/^\\S/<CR>", "()"},
    }
  }
}
wk.register(keymap, {prefix = '<leader>'})

if vim.g.neovide then
  local gui_keymap = {
    T = {
      f = {
        name = "+font",
        ["+"] = {"<CMD>lua FontIncrease()<CR>", "+"},
        ["-"] = {"<CMD>lua FontDecrease()<CR>", "-"},
        ["0"] = {"<CMD>lua FontReset()<CR>", "reset"},
      }
    }
  };
  wk.register(gui_keymap, {prefix = '<leader>'})
end

local visual_keymap = {
  ["/"] = {":<c-u>call CommentOperator(visualmode())<cr>", "comment"},
  t = {
    name = "+text",
    a = {
      name = "+align",
      [","] = {":Tabularize /,<CR>", ","},
      ["-"] = {":Tabularize /-<CR>", "-"},
      ["|"] = {":Tabularize /|<CR>", "|"},
      ["="] = {":Tabularize /=<CR>", "="},
      ["{"] = {":EasyAlign\\ g/^\\S/<CR>", "{}"},
      ["["] = {":EasyAlign\\ g/^\\S/<CR>", "[]"},
      ["("] = {":EasyAlign\\ g/^\\S/<CR>", "()"},
    }
  }
};
wk.register(visual_keymap, {mode = "v", prefix = '<leader>'})

local localkeymap = {
  ["="] = {"gg=G``", "format"},
  t = {
    name = "+test",
    t = {":TestNearest<CR>", "nearest"},
    f = {":TestFile<CR>", "file"},
    s = {":TestSuite<CR>", "suite"},
    l = {":TestLast<CR>", "last"},
    v = {":TestVisit<CR>", "visit"}
  }
}
wk.register(localkeymap, {
  prefix = '<localleader>',
  silent = true,
  noremap = true,
  mode = 'n'
})
