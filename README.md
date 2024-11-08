# Neovim Configuration

A modern Neovim configuration focused on efficient development with LSP support, debugging capabilities, and quality-of-life improvements.

## Features

- 🚀 Full LSP support via `nvim-lspconfig`
- 🔍 Fuzzy finding with Telescope
- 🌳 File explorer with nvim-tree
- 🎨 Code highlighting with Treesitter
- 🐛 Debugging support with DAP and UI
- 📝 Markdown preview functionality
- 🔄 Git integration with git-blame
- 🧭 Project management with project.nvim
- ⚡ Fast navigation with harpoon and tmux integration

## Installation

1. Backup your existing Neovim configuration:
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone this repository:
```bash
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
```

3. Start Neovim - plugins will be automatically installed via lazy.nvim

## Structure

```
.
├── ftplugin/
│   └── markdown.lua          # Markdown-specific settings
├── init.lua                  # Main configuration entry point
├── lazy-lock.json           # Plugin version lock file
└── lua/
    ├── core/                # Core Neovim configurations
    │   ├── keymaps.lua      # Key mappings
    │   ├── options.lua      # Neovim options
    │   └── terminal.lua     # Terminal configurations
    └── plugins/             # Plugin configurations
        ├── lspconfig.lua    # LSP settings
        ├── treesitter.lua   # Syntax highlighting
        ├── telescope.lua    # Fuzzy finder
        └── ...             # Other plugin configs
```

## Plugin List

### Core Plugins
- nvim-lspconfig - Language Server Protocol support
- nvim-treesitter - Advanced syntax highlighting
- telescope.nvim - Fuzzy finder and searcher
- nvim-cmp - Completion engine

### Development Tools
- nvim-dap - Debug Adapter Protocol support
- nvim-dap-ui - Debugging user interface
- harpoon - Quick file navigation
- project.nvim - Project management

### UI Enhancements
- lualine.nvim - Status line
- nvim-tree - File explorer
- barbecue.nvim - Winbar/breadcrumbs
- indent-blankline.nvim - Indentation guides

### Editor Features
- nvim-autopairs - Auto-close pairs
- nvim-surround - Surround selections
- vim-commentary - Code commenting
- markdown-preview - Live markdown preview

### Navigation & Integration
- vim-tmux-navigator - Seamless tmux navigation
- vim-maximizer - Window maximizer
- bigfile.nvim - Large file handling

## Requirements

- Neovim >= 0.8.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for icons (optional but recommended)
- Node.js (for LSP servers)
- ripgrep (for Telescope file search)

## Customization

The configuration is modular and easy to customize:

- Modify core settings in `lua/core/`
- Add or modify plugins in `lua/plugins/`
- Add language-specific settings in `ftplugin/`

## Key Bindings

See `lua/core/keymaps.lua` for the complete list of key mappings.

Some notable default mappings:
- `<Space>` - Leader key
- `<Leader>ff` - Find files
- `<Leader>fg` - Live grep
- `<Leader>e` - Toggle file explorer
- `<Leader>db` - Toggle debug breakpoint

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
