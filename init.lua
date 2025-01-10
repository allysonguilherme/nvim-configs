require("config.lazy")
require("mason").setup()
require('overseer').setup({
    templates = {
        "builtin",
        "user.cpp_build",
        "user.cpp_run",
        "user.cpp_clang"
    }
})

vim.opt.clipboard = "unnamedplus"

local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4

vim.wo.number = true

require("mason-lspconfig").setup {
    ensure_installed = { "omnisharp" }
}

require 'lspconfig'.omnisharp.setup {}

vim.keymap.set({"n"}, "<leader>k", "<cmd>Format<cr>")
vim.keymap.set({"n"}, "\\o", "<cmd>OverseerRun<cr>")
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
