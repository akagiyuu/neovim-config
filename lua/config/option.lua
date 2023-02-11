require('util').vim_opts {
    g = {
        mapleader               = ' ',
        loaded_node_provider    = false,
        loaded_perl_provider    = false,
        loaded_python3_provider = false,
        loaded_ruby_provider    = false,
    },
    opt = {
        termguicolors  = true,
        guifont        = {
            'CaskaydiaCove NF:h11',
        },
        laststatus     = 3,
        cmdheight      = 0,
        shada          = '',
        wrap           = false,
        undofile       = true,
        updatetime     = 50,
        timeoutlen     = 250,
        showmode       = false,
        clipboard      = 'unnamedplus',

        number         = true,
        relativenumber = true,
        signcolumn     = 'number',

        softtabstop    = 4,
        tabstop        = 4,
        shiftwidth     = 4,
        expandtab      = true,

        fillchars      = {
            fold = ' ',
            eob = ' ',
            foldsep = ' ',
        },
        list           = true,
        listchars      = {
            tab      = '» ',
            -- lead     = '·',
            trail    = '·',
            extends  = '<',
            precedes = '>',
            conceal  = '┊',
            nbsp     = '␣',
        },

        preserveindent = true,
        foldlevel      = 99,

        scrolloff      = 8,

        splitbelow     = true,
        splitright     = true,
        splitkeep      = 'screen',

        spelloptions   = 'camel,noplainbuffer',

        mouse          = 'a',
        mousemoveevent = true,

        winblend       = 10,
        -- pumblend       = 10
    }
}
