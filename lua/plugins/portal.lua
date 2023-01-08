return {
    'cbochs/portal.nvim',
    keys = {
        { '<leader>o', function() require('portal').jump_backward() end, desc = 'Jump backward' },
        { '<leader>i', function() require('portal').jump_forward() end, desc = 'Jump forward' }
    },
    config = {
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
}
