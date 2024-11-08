-- ~/.config/nvim/lua/plugins/markdown-preview.lua
return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    -- build = function()
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        
        -- Enable Mermaid diagram support
        vim.g.mkdp_preview_options = {
            mkit = {},
            katex = {},
            uml = {},
            maid = {},
            disable_sync_scroll = 0,
            sync_scroll_type = 'middle',
            hide_yaml_meta = 1,
            sequence_diagrams = {},
            flowchart_diagrams = {},
            content_editable = false,
            disable_filename = 0,
            mermaid = {
                theme = 'default',
                logLevel = 3,
                flowchart = { 
                    curve = 'linear',
                },
            }
        }

        -- Use a specific browser
        -- vim.g.mkdp_browser = 'firefox'  -- Uncomment and modify if needed
        
        -- Auto close preview when leaving buffer
        vim.g.mkdp_auto_close = 1
    end,
    ft = { "markdown" },
}
