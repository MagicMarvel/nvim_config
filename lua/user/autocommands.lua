vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end

--  tabstop=X	ts	编辑时一个TAB字符占多少个空格的位置。
--  shiftwidth=X	sw	使用每层缩进的空格数。
--  (no)expandtab	(no)et	是否将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>
--  softtabstop=X	sts	方便在开启了et后使用退格（backspace）键，每次退格将删除X个空格
--  (no)smarttab	(no)st	开启时，在行首按TAB将加入sw个空格，否则加入ts个空格。
vim.cmd [[
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
]]
