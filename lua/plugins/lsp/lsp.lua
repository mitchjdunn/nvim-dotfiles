return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  setup = {
    gopls = function(_, opts)
      -- workaround for gopls not supporting semanticTokensProvider
      -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
      LazyVim.lsp.on_attach(function(client, _)
        if not client.server_capabilities.semanticTokensProvider then
          local semantic = client.config.capabilities.textDocument.semanticTokens
          client.server_capabilities.semanticTokensProvider = {
            full = true,
            legend = {
              tokenTypes = semantic.tokenTypes,
              tokenModifiers = semantic.tokenModifiers,
            },
            range = true,
          }
        end
      end, "gopls")
      -- end workaround
    end,
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    -- Additional lua configuration, makes nvim stuff amazing!
    { "antosha417/nvim-lsp-file-operations", config = true },
    { 'folke/neodev.nvim',                opts = {} },
  },
  config = function()
    require('mason').setup()
    local mason_lspconfig = require('mason-lspconfig')

    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    --
    -- Add the mason-lspconfig setup with jdtls exclusion
    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "gopls" },  -- Add your required servers
      automatic_installation = {
        exclude = { "jdtls" }  -- Exclude jdtls as it's handled by nvim-jdtls
      }
    })

    -- Define a table of servers to ignore in the general handler
    local ignored_servers = {
      ["jdtls"] = true
    }

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)

        if ignored_servers[server_name] then
          return
        end

        lspconfig[server_name].setup({
          capabilities = lsp_capabilities,
        })
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = lsp_capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = lsp_capabilities,
          filetypes = { "html", "templ", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,
      ["templ"] = function()
        lspconfig["templ"].setup({
            capabilities = lsp_capabilities
        })
      end,
      ["gopls"] = function()
        lspconfig["gopls"].setup({
            capabilities = lsp_capabilities
        })
      end,
      ["html"] = function()
        lspconfig["html"].setup({
            capabilities = lsp_capabilities,
            filetypes = {"html", "templ"}
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = lsp_capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
