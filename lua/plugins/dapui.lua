return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"

        },
        config = function ()
            require("dapui").setup()
            vim.keymap.set({"n"}, '<leader>dp', '<Cmd>lua require"dap".toggle_breakpoint()<CR>')
            vim.keymap.set({"n"}, '<leader>dc', '<Cmd>lua require"dap".continue()<CR>')
            vim.keymap.set({'n'}, '<leader>dt', '<Cmd>lua require"dap".terminate()<CR>')
        end
    }
}
