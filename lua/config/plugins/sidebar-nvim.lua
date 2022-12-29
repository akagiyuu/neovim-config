return {
    'sidebar-nvim/sidebar.nvim',
    keys = { { '<leader>sb', '<cmd>SidebarNvimToggle<CR>', silent = true, desc = 'Toggle sidebar' } },
    config = {
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
}
