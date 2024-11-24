local g                   = vim.g
local opt                 = vim.opt

g.mapleader               = ' '
g.maplocalleader          = ' '
g.loaded_node_provider    = false
g.loaded_perl_provider    = false
g.loaded_python3_provider = false
g.loaded_ruby_provider    = false
g.editorconfig            = false

opt.termguicolors         = true
opt.guifont               = { 'Monaspace Radon:h11' }
opt.laststatus            = 3
opt.cmdheight             = 0
opt.shada                 = ''
opt.wrap                  = false
opt.undofile              = true
opt.updatetime            = 50
opt.timeoutlen            = 250
opt.showmode              = false
opt.clipboard             = 'unnamedplus'

opt.number                = true
opt.numberwidth           = 2
opt.signcolumn            = 'yes'

opt.softtabstop           = 4
opt.tabstop               = 4
opt.shiftwidth            = 4
opt.expandtab             = true

opt.fillchars             = {
    fold = ' ',
    eob = ' ',
    foldsep = ' ',
}
opt.list                  = true
opt.listchars             = {
    tab      = '» ',
    -- lead     = '·'
    trail    = '·',
    extends  = '<',
    precedes = '>',
    conceal  = '┊',
    nbsp     = '␣',
}

opt.preserveindent        = true
opt.foldlevel             = 99

opt.scrolloff             = 8
opt.sidescrolloff         = 8

opt.splitbelow            = true
opt.splitright            = true
opt.splitkeep             = 'screen'

opt.spelloptions          = 'camel,noplainbuffer'

opt.mouse                 = 'a'
opt.mousemoveevent        = true

-- opt.winblend       = 10
-- pumblend       = 10

opt.conceallevel          = 2
opt.smoothscroll          = true

vim.diagnostic.config {
    virtual_text = true,
    update_in_insert = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
        }
    },
    underline = true,
    severity_sort = true,
    float = { border = 'rounded' }
}
