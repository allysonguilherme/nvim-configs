return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "Issafalcon/neotest-dotnet"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-dotnet")
                }
            })
            vim.keymap.set({'n'}, '<leader>td', '<Cmd>lua require("neotest").run.run({strategy = "dap"})<CR>')
            vim.keymap.set({'n'}, '<leader>tn', '<Cmd>lua require("neotest").run.run()<CR>')
            vim.keymap.set({'n'}, '<leader>tf', '<Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
        end
    }
}
