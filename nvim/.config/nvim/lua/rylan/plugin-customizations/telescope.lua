local M = {}

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '' })
        vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Project search for Git-tracked files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find files using live grep search' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })

        -- Custom find_files which shows hidden files
        vim.keymap.set('n', '<leader>ff', function ()
            builtin.find_files({
                hidden = true,
            })
        end , { desc = 'Find files' })

        -- Custom keybinding for searching through dotfiles
        -- Find more references: https://github.com/tjdevries/config_manager/blob/ee11710c4ad09e0b303e5030b37c86ad8674f8b2/xdg_config/nvim/lua/tj/telescope/init.lua
        vim.keymap.set('n', '<leader>fd', function()
            builtin.git_files({
                shorten_path = true,
                cwd = '~/.dotfiles',
                prompt_title = 'Dotfiles Search',
                height = 5,
                previewer = false,
                layout_config = {
                    height = 0.45
                }
            })
        end, { desc = 'Find in dotfiles' })
    end
}
