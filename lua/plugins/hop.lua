return {
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            local hop = require('hop')
            local directions = require('hop.hint').HintDirection
            vim.keymap.set('', 'f', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
            end, { remap = true })
            vim.keymap.set('', 'F', function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
            end, { remap = true })
            vim.keymap.set('', 't', function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
            end, { remap = true })
            vim.keymap.set('', 'T', function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
            end, { remap = true })

            vim.api.nvim_set_keymap('n', '<leader>hp', ":HopPattern<CR>", { noremap = true, silent = true })
        end
    }
}
