local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
    debug = false,
    -- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    filetypes = { "markdown", "text" },
    sources = {
        -- 设置4格缩进
        formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--tab-width=4" } })

    },
    on_attach = function(client, bufnr)
        -- 连接上语言服务器后，开启保存就自动格式化的配置
        local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end
})
