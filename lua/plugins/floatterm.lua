return { 
  "voldikss/vim-floaterm",
    config = function()
        -- Optional: Configure FloatTerm settings
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
        vim.g.floaterm_position = 'center'
        vim.g.floaterm_title = 'Terminal [$1/$2]'
    end,
    -- Load when first command is executed
    cmd = {
        "FloatermNew",
        "FloatermToggle",
        "FloatermPrev",
        "FloatermNext",
        "FloatermFirst",
        "FloatermLast",
        "FloatermUpdate",
        "FloatermShow",
        "FloatermHide",
        "FloatermKill",
        "FloatermSend",
    },
}
