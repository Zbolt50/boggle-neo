local keymap = vim.keymap
local defaults = { noremap = true, silent = true }
-- VIM KEYMAPS
vim.g.mapleader = " "
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Quick Exit
keymap.set("n", "<leader>w", ":w<CR>", defaults)
keymap.set("n", "<leader>a", ":wqa<CR>", defaults)
keymap.set("n", "<leader>q", ":q!<CR>", defaults)
keymap.set("n", "<leader>qa", ":qa!<CR>", defaults)

-- Copy and Paste
keymap.set("n", "<leader>ya", "ggyG")

-- Make items executable without leaving nvim!
-- keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- Switch Windows
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
-- Insert empty line without entering insert mode
keymap.set("n", "<leader>o", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', defaults)
keymap.set("n", "<leader>O", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', defaults)
