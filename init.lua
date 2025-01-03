require("config.lazy")

vim.opt.clipboard = "unnamedplus"

local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4

vim.wo.number = true

require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = { "omnisharp" }
}

require'lspconfig'.omnisharp.setup{}
