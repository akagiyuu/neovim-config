local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end


return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        opts = {
            options = {
                icons_enabled = true,
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { {
                    'mode',
                    fmt = function(str)
                        return ' ' .. str:sub(1, 1) .. str:sub(2):lower()
                    end
                } },
                lualine_b = {
                    {
                        'branch',
                    },
                    {
                        'diff',
                        source = diff_source,
                        symbols = { added = ' ', modified = ' ', removed = ' ' },
                    }
                },
                lualine_c = { 'filename' },
                lualine_x = { 'diagnostics' },
                lualine_y = { 'filetype' },
                lualine_z = { 'progress', 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = { 'toggleterm' }
        }
    },
}
