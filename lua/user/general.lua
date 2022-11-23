--  tabstop=X	ts	编辑时一个TAB字符占多少个空格的位置。
--  shiftwidth=X	sw	使用每层缩进的空格数。
--  (no)expandtab	(no)et	是否将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>
--  softtabstop=X	sts	方便在开启了et后使用退格（backspace）键，每次退格将删除X个空格
--  (no)smarttab	(no)st	开启时，在行首按TAB将加入sw个空格，否则加入ts个空格。
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.rnu = true
