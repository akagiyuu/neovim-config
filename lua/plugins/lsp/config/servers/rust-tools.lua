return function(capabilities)
    return {
        'simrat39/rust-tools.nvim',
        ft = 'rust',
        config = function()
            require('rust-tools').setup {
                tools = { inlay_hints = { auto = false }, },
                server = {
                    capabilities = capabilities,
                    settings = {
                        ['rust-analyzer'] = {
                            checkOnSave = {
                                command = 'clippy',
                            },
                            diagnostics = {
                                enable = true,
                                experimental = { enable = true }
                            }
                        }
                    }
                }
            }
        end
    }
end
