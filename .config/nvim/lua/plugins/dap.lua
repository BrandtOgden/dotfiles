return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    require("mason").setup()
    require("mason-nvim-dap").setup({
      ensure_installed = { "debugpy", "codelldb" },
      automatic_installation = false,
      handlers = {},
    })

    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>dc", dap.continue)
    vim.keymap.set("n", "<leader>dr", dap.run_to_cursor)
    vim.keymap.set("n", "<leader>ds", dap.step_over)
    vim.keymap.set("n", "<leader>di", dap.step_into)
    vim.keymap.set("n", "<leader>do", dap.step_out)
    vim.keymap.set("n", "<leader>dt", dap.restart, { desc = "Debugger: resTart" })

    -- TODO: Not sure if I want all of these keymaps but something to keep in mind
    -- vim.keymap.set("n", "<Leader>B", function()
    --   dap.set_breakpoint()
    -- end)
    -- vim.keymap.set("n", "<Leader>lp", function()
    --   dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    -- end)
    -- vim.keymap.set("n", "<Leader>dr", function()
    --   dap.repl.open()
    -- end)
    -- vim.keymap.set("n", "<Leader>dl", function()
    --   dap.run_last()
    -- end)
    --   vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
    --     require("dap.ui.widgets").hover()
    --   end)
    --   vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
    --     require("dap.ui.widgets").preview()
    --   end)
    --   vim.keymap.set("n", "<Leader>df", function()
    --     local widgets = require("dap.ui.widgets")
    --     widgets.centered_float(widgets.frames)
    --   end)
    --   vim.keymap.set("n", "<Leader>ds", function()
    --     local widgets = require("dap.ui.widgets")
    --     widgets.centered_float(widgets.scopes)
    --   end)

    -- Have dap-ui open automatically when debugger is activated
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
