return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>",
            { noremap = true, silent = true, desc = "Abrir/fechar o NvimTree" })
        vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>",
            { noremap = true, silent = true, desc = "Focar no arquivo atual" })
    end,
}