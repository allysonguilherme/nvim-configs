return {
    {
        "puremourning/vimspector",
        config = function ()
            vim.keymap.set({'n'}, '<F9>', '<Cmd>call vimspector#ToggleBreakpoint()<CR>' )
            vim.keymap.set({'n'}, '<F5>', '<Cmd>call vimspector#Launch()<CR>' )
            vim.keymap.set({'n'}, '<F6>', '<Cmd>call vimspector#Reset()<CR>' )
        end
    }
}
