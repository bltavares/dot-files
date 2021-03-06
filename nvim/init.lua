local fn = vim.fn
local os_separator = package.config:sub(1,1)

-- TODO
-- paredit ? parinfer?
-- session?
---- https://github.com/glepnir/dashboard-nvim
---- https://github.com/rmagatti/auto-session
---- https://github.com/tpope/vim-obsession
-- lsp
---- https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim
-- indent blankline
-- debug
---- https://github.com/mfussenegger/nvim-dap
---- https://github.com/theHamsta/nvim-dap-virtual-text
-- https://github.com/windwp/nvim-autopairs
-- https://github.com/lewis6991/spellsitter.nvim
-- https://github.com/oberblastmeister/neuron.nvim
-- ui
---- https://github.com/edluffy/specs.nvim
-- https://github.com/andweeb/presence.nvim
-- https://github.com/simrat39/symbols-outline.nvim

for _, f in ipairs(fn.split(fn.glob(fn.stdpath('config') .. '/lua/*.lua'), "\n")) do
	local parts = fn.split(f, os_separator)
	local file = parts[#parts]
	local config = fn.split(file, '\\.')[1]
	require(config)
end
