-- Check if JDTLS is already running
local bufnr = vim.api.nvim_get_current_buf()
local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
for _, client in ipairs(clients) do
  if client.name == "jdtls" then
    return -- Exit if JDTLS is already attached
  end
end
-- JDTLS (Java LSP) configuration
local home = vim.env.HOME -- Get the home directory

local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/jdtls-workspace/" .. project_name

local java_home = vim.fn.trim(vim.fn.system('~/.jenv/bin/jenv javahome'))
-- Path to tools.jar (contains the annotation processor)
local tools_jar = java_home .. "/lib/tools.jar"

local system_os = ""

-- Determine OS
if vim.fn.has("mac") == 1 then
  system_os = "mac"
elseif vim.fn.has("unix") == 1 then
  system_os = "linux"
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  system_os = "win"
else
  print("OS not found, defaulting to 'linux'")
  system_os = "linux"
end

-- Needed for debugging
local bundles = {
  vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}

-- Needed for running/debugging unit tests
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", true), "\n"))

local function on_attach(client, bufnr)
    -- Set up DAP
    jdtls.setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()
end
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  on_attach = on_attach,
  cmd = {
        vim.fn.expand("~/.jenv/shims/java"),
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "--add-modules=jdk.compiler",
        "--add-exports", "jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED",
        "--add-exports", "jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED",
        "--add-exports", "jdk.compiler/com.sun.tools.javac.main=ALL-UNNAMED",
        "--add-exports", "jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED",
        "--add-exports", "jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED",
        "--add-exports", "jdk.compiler/com.sun.tools.javac.processing=ALL-UNNAMED",
        "--add-exports", "jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED",
        "--add-exports", "jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. home .. "/.m2/repository/org/projectlombok/lombok/1.18.24/lombok-1.18.24.jar",
        "-Xmx4g",
        "-jar", vim.fn.expand("~/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar"),
        "-configuration", vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/config_" .. system_os),
        "-data", workspace_dir,
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {
      home = "~/.jenv/shims/java",
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        -- TODO Update this by adding any runtimes that you need to support your Java projects and removing any that you don't have installed
        -- The runtime name parameters need to match specific Java execution environments.  See https://github.com/tamago324/nlsp-settings.nvim/blob/2a52e793d4f293c0e1d61ee5794e3ff62bfbbb5d/schemas/_generated/jdtls.json#L317-L334
        runtimes = {
          {
            name = "OpenJDK_17",
            path = "~/.jenv/shims/java",
          },
          plugins = {
            "lombok",
          },
        },
        jdt = {
          ls = {
            lombokSupport = true,
          },
        },
        -- Add MapStruct specific settings
        annotationProcessing = {
          enabled = true,
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      signatureHelp = { enabled = true },
      format = {
        enabled = true,
        -- Formatting works by default, but you can refer to a specific file/URL if you choose
        -- settings = {
        --   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
        --   profile = "GoogleStyle",
        -- },
      },
    },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
        -- Add MapStruct favorites
        "org.mapstruct.Mapper",
        "org.mapstruct.Mapping",
        "org.mapstruct.MappingTarget",
        "org.mapstruct.factory.Mappers",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org",
      },
    },
    -- Enable annotation processing support
    compiler = {
      annotationProcessing = {
        enabled = true,
      },
    },
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  -- Needed for auto-completion with method signatures and placeholders
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    -- References the bundles defined above to support Debugging and Unit Testing
    bundles = bundles,
  },
}

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)
