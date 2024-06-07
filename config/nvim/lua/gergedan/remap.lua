vim.keymap.set("n", "<leader>o", vim.cmd.Ex)

-- move line when line is highlighted using ctrl+movement
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- static cursor
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- deletes highlighted word and pastes the buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- clipboard copying with leader
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- disable Q
vim.keymap.set("n", "Q", "<nop>")

-- TODO integrate this -- switch between open tmux sessions
--vim.keymap.set("n", "<C-F>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- replace string over file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- replace string over line
vim.keymap.set("n", "<leader>x", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- open packer easily
vim.keymap.set("n", "<leader>ep", "<cmd>e $HOME/.config/nvim/lua/$USER/packer.lua<CR>")
vim.keymap.set("n", "<leader>ec", "<cmd>e $HOME/.config/nvim/after/plugin/colors.lua<CR>")
vim.keymap.set("n", "<leader>es", "<cmd>e $HOME/.config/nvim/after/plugin/snippets.lua<CR>")

-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("v", "<leader>f", vim.lsp.buf.format)

-- switch between last buffers
vim.keymap.set("n", "<leader>b", "<cmd>b#<CR>")

-- ???? FIXME
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- window remaps
vim.keymap.set("n", "<leader>h", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<leader>j", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<leader>+", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -5<CR>")
