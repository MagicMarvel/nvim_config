local options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true, -- highlight all matches on previous search pattern
    history = 200, -- EX命令在内存中保存的条数
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    -- termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- enable persistent undo
    updatetime = 300, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

    expandtab = true, -- 是否需要将tab替换为空格
    -- shiftwidth governs indentation via >> and friends (as said in the docs). set shiftwidth=8 makes it so that each >> you do will indent a line 8 character blocks more to the right. Whether it uses tab bytes or space bytes is actually up to a few settings: if noexpandtab is set, it tries its best to use tab bytes alone. If shiftwidth is not divisible by tabstop (e.g. you have set noexpandtab shiftwidth=6 tabstop=4 for some reason), it will use a combination of tabs and spaces to get the proper indent. If expandtab is set, then it will use space bytes alone.
    shiftwidth = 4, -- 进行缩进的时候 `>>` 插入几个字符，不管理tab输入时候，具体插入tab还是空格，取决于是否有设置expandtab，如果有直接插入空格，没有的话优先插入tab，如果shiftwidth的值（6）大于tabstop（4），那就会先插入一个tab再插入2个空格
    -- tabstop doesn't necessarily mean that a tab byte (\x09) will be replaced with a number of space bytes (\x20). It's expandtab that governs whether that happens. tabstop means how long each tabstop will be. set tabstop=8 makes it so that a line starting with a tab byte will appear to be indented 8 character blocks from the left edge of the screen.
    tabstop = 4, -- 一个tab显示为几个字符的宽度
    softtabstop = -1, -- 管理输入一个tab的时候，输入几个空格，当 softtabstop 选项值小于 tabstop 选项值时，第一次按 Tab 键，会插入 softtabstop 选项值对应的多个空格，当插入的空格个数到达 tabstop 指定的宽度时，会删除插入的空格，替换成一个 tab 字符，负数则为shiftwidth的值
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = false, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    rnu = true, -- 设置相对编号
    smarttab = true, -- 开启时，在行首按TAB将加入sw个空格，否则加入ts个空格。
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = true, -- display lines as one long line
    linebreak = true, -- companion to wrap, don't split words
    scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
    sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
    wildmenu = true, -- zsh自动补全菜单
    wildmode = "full", -- zsh自动补全菜单
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c" -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-" -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use

-- 直接指定复制程序的位置，防止neovim用系统调用去找浪费时间
vim.g.clipboard = {
    name = "win32yank",
    copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
}
