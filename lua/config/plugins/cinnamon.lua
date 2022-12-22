local M = {
    'declancm/cinnamon.nvim',
    enabled = function() return not vim.g.neovide end,
    event = 'VeryLazy',
}

M.config = function()
    require('cinnamon').setup {
            default_keymaps = true,
            extra_keymaps = true,
            extended_keymaps = true,
            -- hide_cursor = true,
            -- always_scroll = true,
            scroll_limit = 100,
    }
    vim.keymap.set({ 'n', 'i', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
    vim.keymap.set({ 'n', 'i', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")
    vim.keymap.set({ 'n', 'i', 'x' }, '<S-ScrollWheelUp>', "<Cmd>lua Scroll('3zl', 0, 0, 3)<CR>")
    vim.keymap.set({ 'n', 'i', 'x' }, '<S-ScrollWheelDown>', "<Cmd>lua Scroll('3zh', 0, 0, 3)<CR>")
end

return M
