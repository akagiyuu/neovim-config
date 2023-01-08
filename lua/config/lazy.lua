local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim',
        lazypath,
    }
end
vim.opt.runtimepath:prepend(lazypath)

-- load lazy
require('lazy').setup('plugins', {
    defaults = { lazy = true },
    checker = {
        enabled = false,
        notify = false,
        frequency = 86400,
    },
    install = {
        missing = true,
        colorscheme = { "catppuccin" },
    },
    change_detection = {
        enabled = false,
        notify = false, -- get a notification when changes are found
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.8, height = 0.8 },
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = 'rounded',
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'matchit',
                'matchparen',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
    --   debug = true,
})
