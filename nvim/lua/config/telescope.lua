local actions = require("telescope.actions")
local telescope = require("telescope")
telescope.setup({
  defaults = {
    mappings = { i = { ["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist } },
  },
})
telescope.load_extension("project")

local _utils = require("telescope._extensions.project.utils")
local _git = require("telescope._extensions.project.git")
_G.project_add_cwd = function(arg)
  local path = arg
  if path == nil then
    path = _git.try_and_find_git_path()
  end
  local projects = _utils.get_project_objects()
  local path_not_in_projects = true

  local file = io.open(_utils.telescope_projects_file, "w")
  for _, project in pairs(projects) do
    if project.path == path then
      project.activated = 1
      path_not_in_projects = false
    end
    _utils.store_project(file, project)
  end

  if path_not_in_projects then
    local new_project = _utils.get_project_from_path(path)
    _utils.store_project(file, new_project)
  end

  io.close(file)
  print("Project added: " .. path)
end
