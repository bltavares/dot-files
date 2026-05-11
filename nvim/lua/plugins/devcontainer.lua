return {
  {
    "esensar/nvim-dev-container",
    cmd = { "DevcontainerStart", "DevcontainerStop" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      {
        container_runtime = "docker",
        attach_mounts = {
          always = true,
        },
      },
    },
  },
}
