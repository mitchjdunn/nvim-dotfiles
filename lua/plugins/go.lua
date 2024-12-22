return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Add golang to ensure_installed
      if type(opts.servers) ~= "table" then
        opts.servers = {}
      end
      opts.servers.gopls = opts.servers.gopls or {}
    end,
  },
  -- Go specific configuration
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork", "gosum" })
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "leoluz/nvim-dap-go",
        config = true,
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-go",
    },
    opts = {
      adapters = {
        ["neotest-go"] = {
          -- Here you can specify args for the test command
          args = { "-count=1", "-timeout=60s" }
        }
      }
    },
  }
}
