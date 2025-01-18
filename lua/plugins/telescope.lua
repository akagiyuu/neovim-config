return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-file-browser.nvim',
        'Marskey/telescope-sg',
        'debugloop/telescope-undo.nvim',
    },
    cmd = 'Telescope',
    keys = {
        {
            '<leader>f<Enter>',
            function() require('telescope.builtin').builtin() end,
            desc =
            'All picker'
        },
        { '<leader>fr', function() require('telescope.builtin').resume() end,     desc = 'Resume' },
        { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'File' },
        {
            '<leader>fw',
            function() require('telescope.builtin').live_grep() end,
            desc =
            'Live grep'
        },
        {
            '<leader>fb',
            function() require('telescope').extensions.file_browser.file_browser() end,
            desc =
            'File browser'
        },
        {
            '<leader>fu',
            function() require('telescope').extensions.undo.undo() end,
            desc =
            'Undo tree'
        },
    },
    opts = {
        defaults = {
            sorting_strategy = 'ascending', --Remove this when https://github.com/nvim-telescope/telescope.nvim/issues/2667 is resolved
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
            file_ignore_patterns = { '__pycache__/', 'node_modules/' },

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
                no_ignore = true,
                follow_symlinks = true,
                git_status = false,
            },
            extensions = { undo = {}, }
        },
    },
    config = function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('ast_grep')
        require('telescope').load_extension('undo')
    end
}
