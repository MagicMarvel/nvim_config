local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- 先看这个mason的配置!!!
require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls-config"
