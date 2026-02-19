local dapui = require("dapui")
local dap = require("dap")

--- open ui immediately when debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

vim.fn.sign_define('DapBreakpoint',
  {
    text = '⚪',
    texthl = 'DapBreakpointSymbol',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
  })

vim.fn.sign_define('DapStopped',
  {
    text = '🔴',
    texthl = 'yellow',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
  })
vim.fn.sign_define('DapBreakpointRejected',
  {
    text = '⭕',
    texthl = 'DapStoppedSymbol',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
  })

-- default configuration
dapui.setup({
  expand_lines = true,
  floating = { border = "rounded" },
  -- Set dapui window
  render = {
    max_type_length = 60,
    max_value_lines = 200,
  },
  -- Only one layout: just the "scopes" (variables) list at the bottom
  layouts = {
    {
      elements = {
        { id = "repl", size = 1.0 },
      },
      size = 1,
      position = "bottom",
    },
    {
      elements = {
        { id = "scopes", size = 1.0 }, -- 100% of this panel is scopes
      },
      size = 15,                       -- height in lines (adjust to taste)
      position = "bottom",             -- "left", "right", "top", "bottom"
    },
  },
})


local map = vim.keymap.set

map("n", "<leader>du", function() dapui.toggle() end, { noremap = true, silent = true, desc = "Toggle Debug UI" })

map({ "n", "v" }, "<leader>dw", function() require("dapui").eval(nil, { enter = true }) end,
  { noremap = true, silent = true, desc = "Add word under cursor to Watches" })

map({ "n", "v" }, "Q", function() require("dapui").eval() end,
  {
    noremap = true,
    silent = true,
    desc =
    "Hover/eval a single value (opens a tiny window instead of expanding the full object) "
  })
