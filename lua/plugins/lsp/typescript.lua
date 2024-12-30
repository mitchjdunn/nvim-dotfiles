return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Ensure servers table exists
      if type(opts.servers) ~= "table" then
        opts.servers = {}
      end
      
      -- Configure TypeScript LSP
      opts.servers.tsserver = {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            suggest = {
              includeCompletionsForModuleExports = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
            },
            suggest = {
              includeCompletionsForModuleExports = true,
            },
          },
        },
      }
    end,
  },

  -- Treesitter Configuration
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "json",
          "markdown",
          "markdown_inline"
        })
      end
    end,
  },

  -- Formatting Configuration
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
      },
    },
  },

  -- Mason Package Manager Configuration
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "typescript-language-server",  -- TypeScript/JavaScript LSP
        "prettier",                   -- Code formatter
        "eslint_d",                   -- JavaScript linter
        "js-debug-adapter",           -- JavaScript debugging
      })
    end,
  },

  -- Debugging Configuration
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
    },
    config = function()
      local dap = require("dap")
      
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            require("mason-registry").get_package("js-debug-adapter"):get_install_path()
              .. "/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }

      -- Add configurations for Node.js debugging
      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
      
      -- Add configurations for React debugging
      dap.configurations.typescriptreact = {
        {
          type = "pwa-chrome",
          name = "Launch Chrome against localhost",
          request = "launch",
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
        },
      }
    end,
  },
}
