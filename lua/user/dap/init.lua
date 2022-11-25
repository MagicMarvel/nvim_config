local status_ok, dap = pcall(require, "dap")
if not status_ok then
    return;
end

require('user.dap.ui')
require('user.dap.setting.codelldb')

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<F5>", [[:lua require("dapui").open()<cr>]], opts)
vim.keymap.set("n", "<F6>", [[:lua require("dapui").close()<cr>]], opts)
vim.keymap.set("n", "<F7>", [[:lua require("dapui").toggle()<cr>]], opts)
vim.keymap.set("n", "<F8>", [[:lua require("dap").toggle_breakpoint()<cr>]], opts)
