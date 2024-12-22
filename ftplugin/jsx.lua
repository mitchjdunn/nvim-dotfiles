-- This file should be saved as ~/.config/nvim/after/ftplugin/javascriptreact.lua
-- For TypeScript with JSX (TSX), create a copy at typescriptreact.lua

-- Ensure we don't load this twice
if vim.b.did_ftplugin then
  return
end

-- Mark this filetype as having been loaded
vim.b.did_ftplugin = true

-- Configure indentation for JSX files
vim.opt_local.shiftwidth = 2      -- Size of an indent
vim.opt_local.tabstop = 2         -- Number of spaces tabs count for
vim.opt_local.expandtab = true    -- Use spaces instead of tabs

-- Enable JSX/TSX commenting style
vim.opt_local.commentstring = '{/* %s */}'

-- Configure JSX/TSX specific keymaps
local opts = { buffer = true }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format { async = true }
end, opts)

-- Set up autocompletion for JSX tags
vim.opt_local.iskeyword:append('-') -- Treat tag-names with - as one word

-- Configure LSP diagnostics for React development
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}, vim.api.nvim_get_current_buf())

-- Add additional React snippets path if you're using a snippet engine
local has_snippets, snippets = pcall(require, 'luasnip')
if has_snippets then
  -- You can add custom snippets path here
  -- snippets.add_snippets("javascriptreact", { ... })
end

-- Keep these settings local to the buffer
vim.b.undo_ftplugin = [[
  setlocal shiftwidth< tabstop< expandtab< commentstring<
  unlet! b:did_ftplugin
]]
