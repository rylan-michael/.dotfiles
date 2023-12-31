return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1500,
    config = function()
        require('catppuccin').setup{
            -- flavour = 'mocha',
            background = {
                light = 'latte',
                dark = 'mocha',
            },
            integrations = {
                cmp = true,
                nvimtree = true,
                treesitter = true,
            }
        }
        vim.cmd.colorscheme 'catppuccin'
    end

}