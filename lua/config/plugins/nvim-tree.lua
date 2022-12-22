local M = {
    'kyazdani42/nvim-tree.lua',
    event = 'VeryLazy',
}

M.config = function()
    require('nvim-tree').setup {
        hijack_cursor = true,
        filesystem_watchers = {
            enable = true,
        },
        view = {
            preserve_window_proportions = true,
            -- float = { enable = true }
            -- signcolumn = 'no',
        },
        renderer = {
            highlight_opened_files = 'name',
            group_empty = true,
            highlight_git = true,
            indent_markers = { enable = true },
            icons = { git_placement = 'after' }
        },
        actions = { open_file = { resize_window = true } },
    }

    vim.keymap.set('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>', { silent = true })
end

return M
