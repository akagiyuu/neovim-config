local M = {
    'sidebar-nvim/sidebar.nvim',
    event = 'VeryLazy',
}

M.config = function()
    require('sidebar-nvim').setup {
        sections = {
            'git',
            'diagnostics',
            'symbols',
            'containers',
            'todos',
        },
        todos = {
            icon = '',
            ignored_paths = { '~' },
            initially_closed = false,
        },
    }
    vim.keymap.set('n', '<leader>sb', '<cmd>SidebarNvimToggle<CR>', { silent = true })
end

return M
