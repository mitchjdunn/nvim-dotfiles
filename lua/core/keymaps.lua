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


-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- previous tab

-- projects
keymap.set("n", "<leader>pp", function() Snacks.picker.projects() end)

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

-- Snacks
keymap.set("n", "<leader>ee", function() Snacks.explorer() end)
-- keymap.set("n", "<leader>fp", function() Snacks.picker.projects() end)
keymap.set("n", "<leader>fr", function() Snacks.picker.recents() end)
keymap.set("n", "<leader>z",  function() Snacks.zen() end)
keymap.set("n", "<leader>Z",  function() Snacks.zen.zoom() end)
keymap.set("n", "<leader>.",  function() Snacks.scratch() end)
keymap.set("n", "<leader>S",  function() Snacks.scratch.select() end)
keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end)
keymap.set("n", "<leader>cR", function() Snacks.rename.rename_file() end)
keymap.set("n", "<leader>gg", function() Snacks.lazygit() end)

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- Telescope
keymap.set('n', '<c-p>', function() Snacks.picker.smart() end)
keymap.set('n', '<leader>ff', function() Snacks.picker.smart() end)
keymap.set('n', '<leader>fb', function() Snack.picker.buffers() end)
keymap.set('n', '<leader>fg', function() Snack.picker.grep() end)
--
  -- find keymapping
keymap.set('n', '<leader>fk', function()
  require('telescope.builtin').live_grep({
    search_dirs = {"/home/mitch/.config/nvim/lua/core/keymaps.lua"},
    default_text = ""
  })
end, {})

--- terminal settings
keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")
-- keymap.set("t", "<esc>", "<C-\\><C-n>")
keymap.set("t", "<C-g>", "<C-\\><C-n>")
keymap.set("t", "<C-k>", "<up>")               -- save and quit
keymap.set("t", "<C-j>", "<down>")             -- save and quit
keymap.set("t", "<C-h>", "<left>")             -- save and quit
keymap.set("t", "<C-l>", "<right>")            -- save and quit
keymap.set("n", "<leader><enter>", function() Snacks.terminal() end)            -- save and quit
-- keymap.set("n", "<leader><enter>", require('core.terminal').toggle, {
--   -- Terminal toggle
--   desc = "Toggle terminal",
--   silent = true,
--   noremap = true
-- })
