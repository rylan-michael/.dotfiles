vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- save file
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<Cmd>w<CR><Esc>', { desc = 'Save file'})

-- quit all
vim.keymap.set('n', '<Leader>qq', '<Cmd>qa<CR>', { desc = 'Quit all' })

-- Resize window using <ctrl> arrow keys
-- vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
-- vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
-- vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Increase window width' })
-- vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Move around highlighted code.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Freeze cursor in same place even when pasting lines that extend far into the
-- right.
vim.keymap.set("n", "J", "mzJ`z")
-- Scrolls buffer to force a middle positioned cursor during half-page jumps.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Scrolls buffer to force search terms to appear in the  middle.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace selection with paste buffer without losing the original paste buffer.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- + register (system clipboard) yank into system clipboard reigster.
-- You could <leader>yap to yank paragraph plus the line after.
-- You could <leader>yip to yank paragraph and no line after.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete  into void.
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix lists
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace the work that the cursor is over
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/dotfiles/nvim/lua/rylan/packer.lua<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
