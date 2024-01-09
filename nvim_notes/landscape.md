# NVIM Landscape

## NVIM General

`q:` opens the commands window
- `<C-w>_` maximize buffer window
- `<C-w>=` equalize buffer windows

### Replace/Substitute

Prepend "#"

1. Visually select lines
2. Enter command `s/^/#/`

Remove "#"

1. Visually select lines
2. Enter `s/^#/`

Turn ``- `K`: ...`` to ``- `K` ...`` globally and while reviewing each sub

1. Enter ``%s/`:/`/gc``
    - `:%s` is the substitution command that operates on the entire file.
    - `/gc` the `g` stands for "global", which replaces all occurrences in a line, not just the first one. `c` stands for "confirm", which prompts you before each substitution.

---

Mason is a "package manager" for LSP, DAP, Linters, & Formatters. It's just a
manager. You still need the relevant tools.

Linting and formatting are tricky to have a catch-all solution for and are
dependent on order or operations. For this reason, most don't have a catch-all
solution in their nvim setup. On a case-by-case basis they could create an
`autocmd` and search `*.ts` with `BufWrite` and then call prettier and eslint
in a particular order. Additionally, it seems like linting is just a tricky
feature to configure correctly so I may skip it.

lsp-zero bundles all the "boilerplate code" needed to have `nvim-cmp` (an
autocomplete plugin) and the LSP client working together.

If there's a need to check whether LSP is working for the current file, run
`:LspInfo`.

- `K`       displays hover info about the symbol under the cursor `:h vim.lsp.buf.hover()`
- `gd`      jumps to the symbol definition `:h vim.lsp.buf.definition()`
- `gD`      jumps to the symbol declaration `:h vim.lsp.buf.declaration()`
- `gi`      lists all symbol implementations `:h vim.lsp.buf.implementation()`
- `go`      jumps to definition of symbol type `:h vim.lsp.buf.type_definition()`
- `gr`      lists all symbol references in quickfix `:h vim.lsp.buf.references()`
- `gs`      display signature information `:h vim.lsp.buf.signature_help()`
- `<F2>`    renames all symbol refs `:h vim.lsp.buf.rename()` 
- `<F3>`    format code in buffer `:h vim.lsp.buf.format()`
- `<F4>`    selects a code action available `:h vim.lsp.buf.code_action()`
- `gl`      show diagnostics in floating window `:h vim.diagnostic.open_float()`
- `[d/]d`   prev/next diagnostic in buffer `:h vim.diagnostic.goto_prev()`

`lspconfig` will search for a roow directory and start analyzing the project as
a whole if applicable. Some language servers have "single file support" enabled,
so if `lspconfig` can't determine the root directory then the current working
directory becomes your root directory.

If your language server doesn't attach to a file, make sure the file and the
project folder meet the requirements of the language server which are documented
per language server in the [list of language server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).
Or inspect the config provided `LspZeroViewConfigSource lua_ls`.

[GitHub: What to do when a language server doesn't start?](https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/what-to-do-when-lsp-doesnt-start.md)

AutoCompletion |lsp-zero-completion-keybindings|

- `<C-Space>`   trigger completion window
- `<C-y>`       confirm autocomplete
- `<C-e>`       cancel autocomplete
- `<C-p>/<C-n>` prev/next completion in menu

Formatting

Formatting is opt-in and handled by the formatter.vim plugin. The current
formatting workflow is to add the file format configuration and then to run
`:Format`when ready to format the file.

Plugins

WhichKey

- `<Shift>-"` will preview buffers

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
