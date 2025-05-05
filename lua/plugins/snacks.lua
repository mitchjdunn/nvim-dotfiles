return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { 
      -- added this from default page in the dashboard.nvim readme
      sections = {
        { section = "header" },
        { section = "keys", gap = 1},
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = {2, 2} },
        { section = "startup" },
      },
      enabled = true 
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { 
      enabled = true,
      projects = {
      },

    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },

  },
}
