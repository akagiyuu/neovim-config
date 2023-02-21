return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-file-browser.nvim',
    },
    keys = {
        { '<leader>f<Enter>', function() require('telescope.builtin').builtin() end,                      desc = 'All picker' },
        { '<leader>fr',       function() require('telescope.builtin').resume() end,                       desc = 'Resume' },
        { '<leader>f/',       function() require('telescope.builtin').current_buffer_fuzzy_find() end,    desc = ' Find' },
        { '<leader>f?',       function() require('telescope.builtin').help_tags() end,                    desc = ' Help' },
        { '<leader>ff',       function() require('telescope.builtin').find_files() end,                   desc = 'File' },
        { '<leader>fw',       function() require('telescope.builtin').live_grep() end,                    desc = 'Live grep' },
        { '<leader>fgc',      function() require('telescope.builtin').git_commits() end,                  desc = '[g]it [c]ommit' },
        { '<leader>fgb',      function() require('telescope.builtin').git_branches() end,                 desc = '[g]it [b]ranch' },
        { '<leader>fgs',      function() require('telescope.builtin').git_status() end,                   desc = '[g]it [s]tatus' },
        { '<leader>fb',       function() require('telescope').extensions.file_browser.file_browser() end, desc = '[f]ile [b]rowser' },
    },
    opts = {
        defaults = {
            prompt_prefix = '🔭 ',
            selection_caret = '  ',
            layout_strategy = 'flex',
            layout_config = {
                height = 0.9,
                width = 0.8,
                prompt_position = 'top'
            },
            winblend = vim.g.neovide and 60 or 0,
            dynamic_preview_title = true,
            file_ignore_patterns = { '__pycache__/', 'node_modules/', '%.lock', 'obj/', 'bin/', 'target/' },

            mappings = {
                i = {
                    -- ['<A-p>'] = require('telescope.actions.layout').toggle_preview,
                    ['<C-Up>'] = 'preview_scrolling_up',
                    ['<C-Down>'] = 'preview_scrolling_down',
                    ['<Esc>'] = 'close',
                },
            },
        },
        extensions = {
            file_browser = {
                grouped = true,
                -- auto_depth = true,
            },
        },

    },
    config =  function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('fzf')
    end
}
