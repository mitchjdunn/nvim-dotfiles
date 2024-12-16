-- Toggle between light and dark themes
local M = {}

function M.toggle_background()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end

return M
