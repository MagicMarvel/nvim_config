local status_ok, dap = pcall(require, "dap")
if not status_ok then
    return;
end

require('user.dap.ui')
require('user.dap.setting.codelldb')
require "user.dap.setting.delve"

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<F5>", [[:lua require("dapui").toggle()<cr>]], opts)
vim.keymap.set("n", "<F9>", [[:lua require("dap").toggle_breakpoint()<cr>]], opts)
vim.keymap.set("n", "<F10>", [[:lua require("dap").step_over()<cr>]], opts)
vim.keymap.set("n", "<F11>", [[:lua require("dap").step_into()<cr>]], opts)
