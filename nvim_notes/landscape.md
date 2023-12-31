# NVIM Landscape

Plugins

Harpoon

Undotree

Fugitive

Telescope

[GitHub: nvim-telescope/telescope.vim](https://github.com/nvim-telescope/telescope.nvim) is a fuzzy finder for neovim. It helps you search, filter, find, and pick things in Lua. Practical examples `:h telescope.actions`.

Has the concept of pickers, sorters, and previewers.

1. Picker: central UI dedicated to varying use cases (finding files, grepping, diagnostics, etc.) see `:h telescope.builtin`.
2. Finder: pipe or interactively generates results to pick over.
3. Prompt: user input that triggers the finder which sorts results in order into the entry manager
4. Results: listed entries scored by sorter from finder results.
5. Previewer: preview of context of selected entry.

- `L-pg`    project search for files that are tracked by git
- `L-ff`    find files
- `L-fg`    live grep search
- `L-fb`    search buffers
- `L-fh`    search help tags

LSP Zero

Neovim supports LSP. [GitHub: VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) provides you a quick way to setup Neovim's LSP client.

Packer

[GitHub: wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) is a package manager for Neovim.

Lazy

`:lazy` - open lazy window

LuaLine

[GitHub: nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) is a statusline for Neovim.


Configurations
Themes