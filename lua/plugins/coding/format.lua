return {
    'mhartington/formatter.nvim',
    cmd = 'Format',
    config = function()
        local util = require 'formatter.util'
        local prettier = {
            exe = 'prettier',
            args = {
                '--stdin-filepath',
                util.escape_path(util.get_current_buffer_file_path()),
                '--tab-width',
                '4',
                '--single-quote',
                '--bracket-spacing',
            },
            stdin = true,
            try_node_modules = true,
        }
        require('formatter').setup {
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                -- javascript = { require('formatter.filetypes.javascript').prettier },
                -- javascriptreact = { require('formatter.filetypes.javascriptreact').prettier },
                -- typescript = { require('formatter.filetypes.typescript').prettier },
                -- typescriptreact = { require('formatter.filetypes.typescriptreact').prettier },
                css = { require('formatter.filetypes.css').prettier },
                scss = { prettier },
                less = { prettier },
                html = { prettier },
                json = { prettier },
                fish = { require('formatter.filetypes.fish').fishindent },
                python = { require('formatter.filetypes.python').autopep8 },
                ['*'] = { require('formatter.filetypes.any').remove_trailing_whitespace }
            }
        }
    end
}
