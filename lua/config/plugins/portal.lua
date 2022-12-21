return {
    'cbochs/portal.nvim',
    event = 'VeryLazy',
    config = function()
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

        vim.keymap.set('n', '<leader>o', require('portal').jump_backward, {
            desc = 'Jump backward'
        })
        vim.keymap.set('n', '<leader>i', require('portal').jump_forward, {
            desc = 'Jump forward'
        })
    end
}
