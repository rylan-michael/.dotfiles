local M = {}

function M.search_all_files()
	require("telescope.builtin").find_files({
		find_command = { "rg", "--files" },
		hidden = true,
	})
end

function M.search_dotfiles()
	require("telescope.builtin").git_files({
		shorten_path = true,
		cwd = "~/.dotfiles",
		prompt_title = "Dotfiles Search",
		height = 5,
		previewer = false,
		layout_config = {
			height = 0.45,
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			-- NOTE: If you are having trouble with this installation,
			--		 refer to the README for telescope-fzf-native for more instructions.
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set(
			"n",
			"<leader>pg",
			builtin.git_files,
			{ desc = "Telescope: Project search for Git-tracked files" }
		)
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Find files using live grep search" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Find help" })

		-- Custom find_files which shows hidden files
		vim.keymap.set("n", "<leader>ff", M.search_all_files, { desc = "Telescope: Find files" })

		-- Custom keybinding for searching through dotfiles
		-- Find more references: https://github.com/tjdevries/config_manager/blob/ee11710c4ad09e0b303e5030b37c86ad8674f8b2/xdg_config/nvim/lua/tj/telescope/init.lua
		vim.keymap.set("n", "<leader>fd", M.search_dotfiles, { desc = "Telescope: Find in dotfiles" })
	end,
}
