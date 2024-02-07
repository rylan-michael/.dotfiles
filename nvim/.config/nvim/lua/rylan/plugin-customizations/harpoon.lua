return {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lia/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end, { desc = "Harpoon: Add mark" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: Toggle UI" })

		-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
		-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
		-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
		-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
	end,
}
