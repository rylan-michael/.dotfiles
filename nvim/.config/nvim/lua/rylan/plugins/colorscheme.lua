return {
    'Mofiqul/vscode.nvim',
    priority = 1500,
    config = function()
        require('vscode').setup({
            style = 'light',

            -- Enable transparent background
            transparent = false,

            -- Enable italic comments
            italic_comments = true,

            -- Disable nvim-tree background color
            disable_nvimtree_bg = true,
        })
        require('vscode').load()
    end
}
-- return {
--     'catppuccin/nvim',
--     name = 'catppuccin',
--     priority = 1500,
--     config = function()
--         require('catppuccin').setup{
--             -- flavour = 'mocha',
--             flavour = 'frappe',
--             background = {
--                 light = 'latte',
--                 dark = 'mocha',
--             },
--             integrations = {
--                 cmp = true,
--                 nvimtree = true,
--                 treesitter = true,
--             }
--         }
--         vim.cmd.colorscheme 'catppuccin'
--     end
-- 
-- }
