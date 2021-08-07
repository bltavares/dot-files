local fn = vim.fn
local wk = require('which-key')

wk.register({
    ['<C-p>'] = {'<Cmd>Telescope commands<CR>', "commands"},
}, {
        silent = true,
        noremap = true,
        mode = "n",
    });


-- TODO: git/fugitive keybindings
-- TODO: session keybindings
-- TODO: mode-mapping of localleader
-- TODO: dap-debug keybindings
-- TODO: access localleader maps over normal leader through m
local keymap = {
    [";"] = {"<Cmd>CommentToggle<CR>", "comment"},
    ["/"] = {'<Cmd>Telescope live_grep<CR>', 'grep'},
    ["*"] = {"<Cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>", 'find word in project'},
    q = {
        name = "+vim",
        q = {'<Cmd>qa!<CR>', 'Quit!'},
        r = {
            '<Cmd>luafile ' .. fn.stdpath('config') .. '/init.lua<CR>', 'Reload'
        }
    },
    e = {
        name = "+editor",
        e = {'<Cmd>e ' .. fn.stdpath('config') .. '/init.lua<CR>', 'edit'},
        p = {
            '<Cmd>e ' .. fn.stdpath('config') .. '/lua/02_plugins.lua<CR>',
            'plugins'
        },
        r = {'<Cmd>luafile %<CR>', 'eval current lua file'},
    },
    b = {
        name = "+buffers",
        b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
        D = {':bufdo bd<CR>', 'do'}
    },
    f = {
        name = '+find',
        f = {'<Cmd>Telescope find_files<CR>', "files"},
        b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
        h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
        c = {
            name = '+commands',
            c = {'<Cmd>Telescope commands<CR>', 'commands'},
            h = {'<Cmd>Telescope command_history<CR>', 'history'}
        },
        q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
        g = {
            name = '+git',
            g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
            c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
            b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
            s = {'<Cmd>Telescope git_status<CR>', 'status'}
        }
    },
    p = {
        name = "+project",
        s = {
            "<Cmd>lua require('session-lens').search_session()<CR>",
            "switch"
        },
        t = {'<Cmd>NvimTreeToggle<CR>', 'project tree'},
        T = {'<Cmd>NvimTreeFindFile<CR>', 'show on tree'},
        r = {'<Cmd>NvimTreeRefresh<CR>', 'refresh tree'},
        f = {'<Cmd>Telescope find_files<CR>', 'files'},
        ["/"] = {'<Cmd>Telescope live_grep<CR>', 'grep'},
        ["?"] = {'<Cmd>TodoTrouble<CR>', 'todos'},
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
            c = {":tabclose<CR>", "close"},
        }
    },
    T = {
        name = "+toggle",
        t = {"<Cmd>Twilight<CR>", "Twilight"},
    },
    t = {
        name = "+text",
        ["/"] = {"<Cmd>CommentToggle<CR>", "comment"},
    }
}
wk.register(keymap, { prefix = '<leader>' })

local visual_keymap = {
    ["/"] = {":<c-u>call CommentOperator(visualmode())<cr>", "comment"},
    t = {
        name = "+text",
        a = {name = "+align",
            [","] = {":Tabularize /,<CR>", ","},
            ["-"] = {":Tabularize /-<CR>", "-"},
            ["|"] = {":Tabularize /|<CR>", "|"},
            ["="] = {":Tabularize /=<CR>", "="},
        },
    }
};
wk.register(visual_keymap, {mode = "v", prefix = '<leader>'})

local localkeymap = {
    t = {
        name = "+test",
        t = {":TestNearest<CR>", "nearest"},
        f = {":TestFile<CR>", "file"},
        s = {":TestSuite<CR>", "suite"},
        l = {":TestLast<CR>", "last"},
        v = {":TestVisit<CR>", "visit"},
    },
}
wk.register(localkeymap, {
    prefix = '<localleader>',
    silent = true,
    noremap = true,
    mode = 'n',
})
