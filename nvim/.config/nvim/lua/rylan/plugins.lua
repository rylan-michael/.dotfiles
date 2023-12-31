local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "rylan.plugin-customizations" },

		{ "tpope/vim-surround" },

		-- Detech tabstop and shiftwidth automatically
		{ "tpope/vim-sleuth" },

		{ "nvim-treesitter/nvim-treesitter-context" },
		{
			-- Lazy loaded by Comment.nvim pre_hook
			"JoosepAlviste/nvim-ts-context-commentstring",
			lazy = true,
		},

		-- "gc" to comment visual regions/lines
		{ "numToStr/Comment.nvim", opts = {} },

		{
			-- Add indentation guides even on blank lines
			"lukas-reineke/indent-blankline.nvim",
			-- See :
		},
	},
})
