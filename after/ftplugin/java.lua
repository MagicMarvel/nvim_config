-- 单独配置java的lsp
-- 需要java17 和 python3.9
local status_ok, jdtls = pcall(require, 'jdtls')
if not status_ok then
    vim.api.nvim_notify("jdtls was installed fail", vim.log.levels.DEBUG, {})
    return
end
local config = {
    cmd = { 'jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
jdtls.start_or_attach(config)
