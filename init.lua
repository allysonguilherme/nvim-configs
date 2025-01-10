require("config.lazy")
require("mason").setup()
require('overseer').setup({
    templates = { "builtin", "user.cpp_build", "user.cpp_run" }
})

vim.opt.clipboard = "unnamedplus"

local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4

vim.wo.number = true

require("mason-lspconfig").setup{
    ensure_installed = { "omnisharp" }
}

require'lspconfig'.omnisharp.setup{}
