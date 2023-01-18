return {
    {
        'kyazdani42/nvim-tree.lua',
        keys = { { '<leader>nt', '<cmd>NvimTreeToggle<CR>', silent = true, desc = 'Toggle nvim-tree' } },
        config = {
            hijack_cursor = true,
            filesystem_watchers = {
                enable = true,
            },
            view = {
                preserve_window_proportions = true,
                -- float = { enable = true }
                -- signcolumn = 'no',
                mappings = {
                    custom_only = false,
                    list = {
                        { key = 'l', action = 'edit' },
                        { key = 'h', action = 'close_node' },
                    }
                },
            },
            renderer = {
                highlight_opened_files = 'name',
                group_empty = true,
                highlight_git = true,
                indent_markers = { enable = true },
                icons = {
                    git_placement = 'after',
                    symlink_arrow = ' ',
                }
            },
            actions = { open_file = { resize_window = true } },
        }
    },
    {
        'sidebar-nvim/sidebar.nvim',
        keys = { { '<leader>sb', '<cmd>SidebarNvimToggle<CR>', silent = true, desc = 'Toggle sidebar' } },
        config = function()
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
    }
}
