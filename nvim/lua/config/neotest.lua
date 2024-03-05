local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)

require("neotest").setup({
  log_level = vim.log.levels.DEBUG,
  adapters = {
    require("rustaceanvim.neotest"),
    require("neotest-go"),
    require("neotest-dart")({
      command = "flutter", -- Command being used to run tests. Defaults to `flutter`
      -- Change it to `fvm flutter` if using FVM
      -- change it to `dart` for Dart only tests
      use_lsp = true, -- When set Flutter outline information is used when constructing test name.
      -- Useful when using custom test names with @isTest annotation
      custom_test_method_names = {},
    }),
  },
})
