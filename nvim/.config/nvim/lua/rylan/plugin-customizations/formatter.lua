return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			-- All formatter configurations are opt-in
			filetype = {
				go = {
					require("formatter.filetypes.go").gofmt,
				},
				json = {
					require("formatter.filetypes.json").prettier,
				},
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for
					-- the "lua" filetype.
					require("formatter.filetypes.lua").stylua,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
				},
				yaml = {
					require("formatter.filetypes.yaml").prettier,
				},
				-- Use the special "*" filetype for defining formatter
				-- configurations on any filetype
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
