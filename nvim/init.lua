local fn = vim.fn
local os_separator = package.config:sub(1,1)

for _, f in ipairs(fn.split(fn.glob(fn.stdpath('config') .. '/lua/*.lua'), "\n")) do
	local parts = fn.split(f, os_separator)
	local file = parts[#parts]
	local config = fn.split(file, '\\.')[1]
	require(config)
end
