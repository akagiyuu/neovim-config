return {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
        require('nvim-dap-virtual-text').setup {
            highlight_new_as_changed = true,
            commented = true,
        }
    end
}
