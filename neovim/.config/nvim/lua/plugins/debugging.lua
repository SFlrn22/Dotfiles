return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters.coreclr = {
        type = "executable",
        command = "/usr/local/netcoredbg",
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.getcwd() .. "/bin/Debug/net8.0/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. ".dll"
          end,
        },
      }
    end,

    keys = function()
      local dap = require("dap")
      return {
        { "<Leader>dt", dap.toggle_breakpoint },
        { "<F5>", dap.continue },
        { "<F10>", dap.step_over },
        { "<F9>", dap.step_back },
        { "<F11>", dap.step_into },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap" },
    opts = { floating = { border = "rounded" } },
    config = function(_, opts)
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
      dapui.setup(opts)
    end,
  },
}
