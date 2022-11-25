-- 在命令行模式下：
-- % 当前完整的文件名
-- %:h 文件名的头部，即文件目录.例如../path/test.c就会为../path
-- %:t 文件名的尾部.例如../path/test.c就会为test.c
-- %:r 无扩展名的文件名.例如../path/test就会成为test
-- %:e 扩展名
-- https://neovim.io/doc/user/cmdline.html#filename-modifiers
local opts = { noremap = true, silent = true }
vim.keymap.set({ "n" }, "<F4>", "<cmd>!clang++-13 % -g -o %:h/build/%:t:r<cr>", opts)
