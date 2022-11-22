local status_ok, notify = pcall(require, "notify")
if not status_ok then
    return
end

notify.setup({
    background_colour = "#1e2030",
    render = "simple",
})
vim.notify = notify
require("telescope").load_extension("notify")
