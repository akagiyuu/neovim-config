return function(capabilities, on_attach)
    return {
        'simrat39/rust-tools.nvim',
        ft = 'rust',
        opts = {
            tools = { inlay_hints = { auto = false }, },
            server = {
                capabilities = capabilities,
                on_attach = on_attach,
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
    }
end
