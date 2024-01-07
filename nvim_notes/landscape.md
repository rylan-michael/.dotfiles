# NVIM Landscape

Linting and formatting are tricky to have a catch-all solution for and are
dependent on order or operations. For this reason, most don't have a catch-all
solution in their nvim setup. On a case-by-case basis they could create an
`autocmd` and search `*.ts` with `BufWrite` and then call prettier and eslint
in a particular order. Additionally, it seems like linting is just a tricky
feature to configure correctly so I may skip it.

Formatting

Formatting is opt-in and handled by the formatter.vim plugin. The current
formatting workflow is to add the file format configuration and then to run
`:Format`when ready to format the file.

Plugins

WhichKey

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
- `:Telescope keymaps`  list normal-mode keymaps

- `H/M/L`   Select High/Middle/Low
- `C-x`     Go to file selection as a split
- `C-v`     Go to file selection as a vsplit

LSP Zero

Neovim supports LSP. [GitHub: VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) provides you a quick way to setup Neovim's LSP client.

Packer

[GitHub: wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) is a package manager for Neovim.

Lazy

`:lazy` - open lazy window

LuaLine

[GitHub: nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) is a statusline for Neovim.

Vim Surround

[GitHub: tpope/vim-surround](https://github.com/tpope/vim-surround)

Configurations

Themes
