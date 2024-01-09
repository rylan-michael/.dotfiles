local M = {}

-- Function to find the git root directory based on the current buffer's path
function M.find_git_root()
	local current_file = vim.api.nvim_buf_get_name(0)
	local current_dir
	local cwd = vim.fn.getcwd()
	-- If the buffer is not associate with a file, return nil
	if current_file == "" then
		current_dir = cwd
	else
		-- Extract the directory from the current file's path
		current_dir = vim.fn.fnamemodify(current_file, ":h")
	end

	-- Find the Git root directory from the current file's path
	local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 then
		print("Not a git repository. Searching on current working directory")
		return cwd
	end
	return git_root
end

function M.live_grep_git_root()
	print("called live_grep_git_root")
	local git_root = M.find_git_root()
	print(git_root)
	if git_root then
		print("success")
		require("telescope.builtin").live_grep({
			search_dirs = { git_root },
			additional_args = function(opts)
				return {
					"--hidden",
				}
			end,
		})
	end
end

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

		-- Enable telescope fzf native, if installed
		pcall(require("telescope").load_extension, "fzf")

		vim.keymap.set(
			"n",
			"<leader>pg",
			builtin.git_files,
			{ desc = "Telescope: Project search for Git-tracked files" }
		)
		vim.keymap.set(
			"n",
			"<leader>fg",
			M.live_grep_git_root,
			{ desc = "Telescope: Find files using live grep search" }
		)
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Find help" })

		-- Custom find_files which shows hidden files
		vim.keymap.set("n", "<leader>ff", M.search_all_files, { desc = "Telescope: Find files" })

		-- Custom keybinding for searching through dotfiles
		-- Find more references: https://github.com/tjdevries/config_manager/blob/ee11710c4ad09e0b303e5030b37c86ad8674f8b2/xdg_config/nvim/lua/tj/telescope/init.lua
		vim.keymap.set("n", "<leader>fd", M.search_dotfiles, { desc = "Telescope: Find in dotfiles" })
	end,
}
