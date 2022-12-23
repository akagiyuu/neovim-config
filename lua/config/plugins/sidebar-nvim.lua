local M = {
    'sidebar-nvim/sidebar.nvim',
    keys = { { '<leader>sb', '<cmd>SidebarNvimToggle<CR>', silent = true } }
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
end

return M
