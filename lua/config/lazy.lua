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

require('lazy').setup {
    spec = {
        { import = 'plugins' },
        { import = 'plugins.colorschemes' },
        { import = 'plugins.heirline.init' },
    },
    defaults = { lazy = true },
    checker = {
        enabled = false,
        notify = false,
        frequency = 86400,
    },
    install = { missing = true },
    change_detection = {
        enabled = false,
        notify = false, -- get a notification when changes are found
    },
    ui = {
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
                'tutor',
                'zipPlugin',
            },
        },
    },
    --   debug = true,
}
