return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		wk.register({
			-- If I feel like going wild with configuration
			-- https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/core/which-key.lua#L7
			["g"] = { name = "[G]it", _ = "which_key_ignore" },
		}, { prefix = "<leader>" })
	end,
}
