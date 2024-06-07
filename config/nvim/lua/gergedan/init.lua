require("gergedan.packer")
require("gergedan.set")
require("gergedan.remap")

local augroup = vim.api.nvim_create_augroup
local GergedanGroup = augroup('Gergedan', {})

local autocmd = vim.api.nvim_create_autocmd
-- removes trailing whitespace
autocmd({"BufWritePre"}, {
    group = GergedanGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
