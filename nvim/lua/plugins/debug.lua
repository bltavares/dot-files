return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "igorlfs/nvim-dap-view" },
    -- stylua: ignore
    keys = {
      { "<localleader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<localleader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
      { "<localleader>dc", function() require("dap").continue() end,                                             desc = "Run/Continue" },
      { "<localleader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
      { "<localleader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
      { "<localleader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
      { "<localleader>dj", function() require("dap").down() end,                                                 desc = "Down" },
      { "<localleader>dk", function() require("dap").up() end,                                                   desc = "Up" },
      { "<localleader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
      { "<localleader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
      { "<localleader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
      { "<localleader>dP", function() require("dap").pause() end,                                                desc = "Pause" },
      { "<localleader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
      { "<localleader>ds", function() require("dap").session() end,                                              desc = "Session" },
      { "<localleader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
    },
    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs({
        Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
        Breakpoint = " ",
        BreakpointCondition = " ",
        BreakpointRejected = { " ", "DiagnosticError" },
        LogPoint = ".>",
      }) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  },
  {
    "igorlfs/nvim-dap-view",
    opts = {
      virtual_text = {
        enabled = true,
      },
    },
    keys = {
      { "<localleader>du", "<cmd>DapViewToggle<CR>", desc = "UI" },
      { "<localleader>dv", "<cmd>DapViewHover<CR>", desc = "value" },
      { "<localleader>dw", "<cmd>DapViewWatch<CR>", desc = "watch" },
    },
  },
}
