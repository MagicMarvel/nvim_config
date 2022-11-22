local status_ok, _ = pcall(require, "neodev")
if not status_ok then
    return
end


require("neodev").setup()
return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            }, completion = {
                callSnippet = "Replace"
            }
        },
    },
}
