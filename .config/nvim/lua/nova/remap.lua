vim.g.mapleader = " "
vim.keymap.set("n", "<leader>nt", vim.cmd.Ex)

vim.keymap.set('n', '<leader>ts', vim.cmd.NvimTreeToggle)

vim.keymap.set("i", "<C-n>", "<C-j>")
vim.keymap.set("n", "<leader>ww", vim.cmd.w)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>qq", vim.cmd.q)

vim.keymap.set("n", "m", "h")
vim.keymap.set("n", "n", "j")
vim.keymap.set("n", "e", "k")
vim.keymap.set("n", "i", "l")

vim.keymap.set("v", "m", "h")
vim.keymap.set("v", "n", "j")
vim.keymap.set("v", "e", "k")
vim.keymap.set("v", "i", "l")

vim.keymap.set("n", "l", "i")
vim.keymap.set("n", "L", "I")
vim.keymap.set("n", "j", "e")
vim.keymap.set("n", "J", "E")

vim.keymap.set("n", "<C-w>m", "<C-w>h")
vim.keymap.set("n", "<C-w>n", "<C-w>j")
vim.keymap.set("n", "<C-w>e", "<C-w>k")
vim.keymap.set("n", "<C-w>i", "<C-w>l")

vim.keymap.set("n", "-", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "=", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

vim.keymap.set("n", "<C-t>t", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<C-t>e", vim.cmd.bn)
vim.keymap.set("n", "<C-t>n", vim.cmd.bp)
vim.keymap.set("n", "<C-t>d", vim.cmd.bd)

vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "N", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "k", "nzzzv")
vim.keymap.set("n", "K", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-e>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-n>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>e", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>n", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/nova/packer.lua<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
