return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        -- Project search for Git-tracked files
        vim.keymap.set('n', '<leader>pg', builtin.git_files, {})

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        -- Custom keybinding for searching through dotfiles
        -- Find more references: https://github.com/tjdevries/config_manager/blob/ee11710c4ad09e0b303e5030b37c86ad8674f8b2/xdg_config/nvim/lua/tj/telescope/init.lua
        vim.keymap.set('n', '<leader>fd', function()
            require('telescope.builtin').git_files({
                shorten_path = true,
                cwd = '~/.dotfiles',
                prompt_title = 'Dotfiles Search',
                height = 5,
                previewer = false,
                layout_config = {
                    height = 0.45
                }
            })
        end, {})
    end
}