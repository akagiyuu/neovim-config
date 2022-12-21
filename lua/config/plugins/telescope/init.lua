return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            config = function() require('telescope').load_extension('fzf') end,
        },
        {
            'nvim-telescope/telescope-file-browser.nvim',
            config = function() require('telescope').load_extension('file_browser') end,
        },
    },
    config = function()
        local telescope = require('telescope')
        local action_layout = require('telescope.actions.layout')

        -- local vertical = {
        --     layout_strategies = 'vertical',
        --     layout_config = {
        --         prompt_position = 'top',
        --         anchor = 'N',
        --     },
        -- }

        telescope.setup {
            defaults = {
                prompt_prefix = '🔭 ',
                selection_caret = '  ',
                layout_strategy = 'flex',
                layout_config = {
                    height = 0.9,
                    width = 0.8,
                    prompt_position = 'top'
                },
                -- winblend = 10,
                dynamic_preview_title = true,
                file_ignore_patterns = { '__pycache__/', 'node_modules/', '%.lock', 'obj/', 'bin/', 'target/' },

                mappings = {
                    i = {
                        ['<A-p>'] = action_layout.toggle_preview,
                        ['<C-Up>'] = 'preview_scrolling_up',
                        ['<C-Down>'] = 'preview_scrolling_down',
                        ['<Esc>'] = 'close',
                    },
                },
                preview = {
                    timeout = 1000,
                },
            },
            -- pickers = {
            --     commands = vertical,
            --     keymaps = vertical,
            --     lsp_references = {
            --         theme = 'cursor',
            --     },
            -- },
        }

        require('config.plugins.telescope.keymap')
    end
}
