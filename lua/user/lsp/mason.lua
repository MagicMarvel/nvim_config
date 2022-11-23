-- 如果想增加新的LSP的支持，只需要把语言服务器的名字写在这里即可
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
    "emmet_ls",
    "eslint"
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
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    -- 这里的handle负责配置例如LSP连接成功了以后，配置keymap，配置VIM的出错图标等等
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

    lspconfig[server].setup(opts)
end
