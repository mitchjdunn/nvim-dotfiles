
-- ~/.config/nvim/lua/core/terminal.lua

-- Create the terminal module
local M = {}

-- Store terminal state
M.terminal_bufnr = nil
M.terminal_winnr = nil

function M.toggle()
    -- Create a new terminal buffer if it doesn't exist
    if M.terminal_bufnr == nil or not vim.api.nvim_buf_is_valid(M.terminal_bufnr) then
        -- Open a new terminal buffer
        vim.cmd('split')
        vim.api.nvim_win_set_height(0, 15)
        vim.cmd('terminal')
        
        -- Configure terminal buffer settings
        M.terminal_bufnr = vim.api.nvim_get_current_buf()
        M.terminal_winnr = vim.api.nvim_get_current_win()
        
        -- Configure terminal buffer settings
        vim.api.nvim_buf_set_option(M.terminal_bufnr, 'buflisted', false)
        vim.api.nvim_buf_set_option(M.terminal_bufnr, 'bufhidden', 'hide')  --
        
        -- Auto-enter insert mode when terminal is focused
        vim.cmd('autocmd BufEnter <buffer> startinsert')
        return
    end
    
    -- If terminal exists but isn't visible, show it
    if M.terminal_winnr == nil or not vim.api.nvim_win_is_valid(M.terminal_winnr) then
        vim.cmd('split')
        vim.api.nvim_win_set_buf(0, M.terminal_bufnr)
        M.terminal_winnr = vim.api.nvim_get_current_win()
        
        vim.api.nvim_buf_set_option(M.terminal_bufnr, 'buflisted', false)
        vim.api.nvim_buf_set_option(M.terminal_bufnr, 'bufhidden', 'hide')
        -- Set window height (adjust as needed)
        vim.api.nvim_win_set_height(M.terminal_winnr, 15)
        
        -- Enter insert mode
        vim.cmd('startinsert')
    else
        -- If terminal is visible, hide it
        vim.api.nvim_win_hide(M.terminal_winnr)
        M.terminal_winnr = nil
    end
end

return M