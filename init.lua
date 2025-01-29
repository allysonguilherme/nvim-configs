-- NOTES: 
-- i'm using coc-nvim with coc-omnisharp for c# lsp functions. I've defined the omnisarp executable location on coc.settings.json'
-- I'm using coc-lua and coc-json and other coc extensions. That plugin is amazing'
-- For debbug my dotnet projects I'm using vimspector thats it's working pretty well with the .vimspector.json placed on my project folder
-- For run tests I'm using neotest and nvim-dap for debbug tests because I could not make the neotest work with the vimspector'
-- remember to use coc-pairs

--automatically load the plugins using lazy
require("config.lazy")
-- using mason for manage lsp's
require("mason").setup()
-- using overseer to automate tasks command
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


vim.keymap.set({ "n" }, "<leader>k", "<cmd>Format<cr>")
vim.keymap.set({ "n" }, "\\o", "<cmd>OverseerRun<cr>")
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


-- neotest com dap e dapui funcionando perfeitamente
local dap = require("dap")
dap.adapters.netcoredbg = {
    type = 'executable',
    command = '/usr/sbin/netcoredbg',
    args = { '--interpreter=vscode' }
}
dap.configurations.cs = {
    {
        type = 'netcoredbg',
        name = 'Launch - netcoredbg',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to DLL: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
    }
}

local dapui = require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
