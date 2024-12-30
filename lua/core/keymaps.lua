-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>wq", ":wq<CR>")       -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>")       -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>")        -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor
keymap.set("i", "<C-k>", "<up>")               -- save and quit
keymap.set("i", "<C-j>", "<down>")             -- save and quit
keymap.set("i", "<C-h>", "<left>")             -- save and quit
keymap.set("i", "<C-l>", "<right>")            -- save and quit

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
keymap.set("n", "<leader>sj", "<C-w>-")     -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+")     -- make split windows height taller
keymap.set("n", "<leader>sl", "<C-w>>5")    -- make split windows width bigger
keymap.set("n", "<leader>sh", "<C-w><5")    -- make split windows width smaller

-- projects
keymap.set("n", "<leader>pp", ":NeovimProjectDiscover<Cr>")

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- previous tab

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>")   -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c")             -- next diff hunk
keymap.set("n", "<leader>cp", "[c")             -- previous diff hunk

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>")  -- open quickfix list
keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>")  -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>")  -- jump to prev quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>")  -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")   -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>")    -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Telescope
keymap.set('n', '<c-p>', require('telescope.builtin').find_files, {})
keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})
keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {})
  -- find keymapping
keymap.set('n', '<leader>fk', function()
  require('telescope.builtin').live_grep({
    search_dirs = {"/home/mitch/.config/nvim/lua/core/keymaps.lua"},
    default_text = ""
  })
end, {})
keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})
keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({ default_text = ":method:" }) end)

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end)
keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end)
keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end)
keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end)
keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end)
keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end)
keymap.set("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end)
keymap.set("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end)
keymap.set("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end)

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- LSP

-- LSP Keybindings (all with <leader>g prefix):
-- `<leader>gg` - Hover documentation
-- `<leader>gd` - Go to definition 
-- `<leader>gD` - Go to declaration
-- `<leader>gi` - Go to implementation
-- `<leader>gr` - Find references
-- `<leader>gf` - Format code
-- `<leader>ga` - Code actions
-- `<leader>gl` - Show diagnostics
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<CR>')
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', '<cmd>Telescope lsp_implementations<CR>')
keymap.set('n', '<leader>gI', '<cmd>lua require("actions-preview").code_actions()<CR>')
keymap.set('n', '<leader>gt', '<cmd>Telescope lsp_type_definitions<CR>')
keymap.set("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>")-- show definition, references
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>") -- show  diagnostics for file
keymap.set("n", "<leader>d", vim.diagnostic.open_float) -- show diagnostics for line
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

--opts.desc = "Show LSP references"
--keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
--
--opts.desc = "Go to declaration"
--keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
--
--opts.desc = "Show LSP definitions"
--keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
--
--opts.desc = "Show LSP implementations"
--keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
--
--opts.desc = "Show LSP type definitions"
--keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
--
--opts.desc = "See available code actions"
--keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
--
--opts.desc = "Smart rename"
--keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
--
--opts.desc = "Show buffer diagnostics"
--keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
--
--opts.desc = "Show line diagnostics"
--keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
--
--opts.desc = "Go to previous diagnostic"
--keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
--
--opts.desc = "Go to next diagnostic"
--keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
--
--opts.desc = "Show documentation for what is under cursor"
--keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
--
--opts.desc = "Restart LSP"
--keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", '<leader>dd', function()
  require('dap').disconnect(); require('dapui').close();
end)
keymap.set("n", '<leader>dt', function()
  require('dap').terminate(); require('dapui').close();
end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
keymap.set("n", '<leader>d?',
  function()
    local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
  end)
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({ default_text = ":E:" }) end)

--- terminal settings
keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")
-- keymap.set("t", "<esc>", "<C-\\><C-n>")
keymap.set("t", "<C-g>", "<C-\\><C-n>")
keymap.set("t", "<C-k>", "<up>")               -- save and quit
keymap.set("t", "<C-j>", "<down>")             -- save and quit
keymap.set("t", "<C-h>", "<left>")             -- save and quit
keymap.set("t", "<C-l>", "<right>")            -- save and quit
keymap.set("n", "<leader><enter>", require('core.terminal').toggle, {
  -- Terminal toggle
  desc = "Toggle terminal",
  silent = true,
  noremap = true
})

--- float term
keymap.set("n", "<leader>ft", ":FloatermNew<CR>")    -- desc = "New Terminal" },
keymap.set("n", "<leader>fn", ":FloatermNext<CR>")   -- desc = "Next Terminal" },
keymap.set("n", "<leader>fp", ":FloatermPrev<CR>")   -- desc = "Prev Terminal" },
keymap.set("n", "<leader>tt", ":FloatermToggle<CR>") -- desc = "Toggle Terminal" },
keymap.set("n", "<leader>tg", function()
  require('core.terminal').toggle_or_create_floating_terminal("lazygit", "lazygit")
end)
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>")

-- keymap.set("n", "<leader>aa", function()
--   require('core.terminal').toggle_or_create_floating_terminal("anthropic_chat", "aider")
-- end)
