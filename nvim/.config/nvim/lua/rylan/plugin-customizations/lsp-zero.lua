return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim", -- Closes gap between mason.nvim and lspconfig

		-- Useful status updates for LSP
		-- Note: `opts = {}` is the same as calling `require('fidget').setup({})
		{ "j-hui/fidget.nvim", opts = {} },

		-- Improve lua language server for nvim specific configuration and runtime
		{ "folke/neodev.nvim" },

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",

		-- Linting

		-- Formatting

		-- Snippets
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local lsp = require("lsp-zero")

		-- Setup keybindings only when you have a lang server active in file.
		-- .default_keymaps() lets us leverage nvim's built-in functions for
		-- various actions like jump to def, rename variable, format file, etc.
		lsp.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			lsp.default_keymaps({ buffer = bufnr })
		end)

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"gopls",
				"lua_ls",
			},
			-- If you need to configure a language server installed by Mason,
			-- add a "handler function"
			handlers = {
				lsp.default_setup,
				-- The name of the handler must be the same as the name of the
				-- language server
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})

		lsp.preset("recommended")

		-- Completion mappings
		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				-- Navigation in the completion menu
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

				-- Ctrl+y key to confirm completion
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				-- Ctrl+Space to trigger completion menu
				["<C-Space>"] = cmp.mapping.complete(),

				-- Navigate between snippet placeholders
				-- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
				-- ['<C-d>'] = cmp_action.luasnip_jump_backward(),

				-- Scroll up and down in the completion documentation
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),

				-- IDK
				["<Tab>"] = nil,
				["<S-Tab>"] = nil,
			}),
		})

		lsp.set_preferences({
			suggest_lsp_servers = false,
			sign_icons = {
				error = "E",
				warn = "W",
				hint = "H",
				info = "I",
			},
		})

		-- on_attach happens on every single buffer that has an associated LSP.
		-- The remaps will only exist for the current buffer and only live for
		-- the life of this buffer.
		--  lsp.on_attach(function(client, bufnr)
		--      local opts = { buffer, bufnr, remap = false }

		--      vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
		--      vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
		--      vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
		--      vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
		--      vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
		--      vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
		--      vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
		--      vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
		--      vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
		--      vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
		--  end)

		-- Indiviual LSP server configurations, reference list from
		-- nvim-lspconfig's server_configuration.md documentation: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		-- lua-language-server

		lsp.setup()

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
