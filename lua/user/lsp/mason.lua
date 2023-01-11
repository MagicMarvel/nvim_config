-- 如果想增加新的LSP的支持，只需要把语言服务器的名字写在这里即可,理论上Mason会自动安装
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local servers = {
    "sumneko_lua",
    "cssls",
    "html",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "tailwindcss",
    "clangd",
    -- "emmet_ls",
    -- "eslint",
    "gopls",
    "marksman",
    -- support XML
    "lemminx",
    "dockerls",
    "volar"
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    -- 在这里填写的语言服务器都会被自动安装
    ensure_installed = servers,
    -- 这里的意思是lspconfig配置了的语言服务器都会被自动安装
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    -- 这里的handle负责配置例如LSP连接成功了以后，配置keymap，配置VIM的出错图标等等，还可以让语言服务器的格式化能力失效
    -- 转为null-ls提供格式化，如ts-server prettier
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    -- 这里是个性化配置LSP的地方，如果你不需要个性化配置的话，这里这一步可以不搞
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
    -- https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D#settings
    local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    -- lspconfig负责利用我们的配置拉起语言服务器并配置语言服务器与VIM
    lspconfig[server].setup(opts)
end
