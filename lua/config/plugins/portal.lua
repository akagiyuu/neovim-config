local M = {
    'cbochs/portal.nvim',
    keys = {
        { '<leader>o', function() require('portal').jump_backward() end, desc = 'Jump backward' },
        { '<leader>i', function() require('portal').jump_forward() end, desc = 'Jump forward' }
    }
}

M.config = function()
    require('portal').setup {
        portal = {
            title = {
                options = {
                    style = 'minimal',
                    border = 'rounded',
                },
            },

            body = {
                options = {
                    border = 'rounded',
                },
            },
        },
    }
end

return M
