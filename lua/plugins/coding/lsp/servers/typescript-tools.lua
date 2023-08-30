return function(on_attach)
    return {
        'pmizio/typescript-tools.nvim',
        lazy = false,
        opts = {
            on_attach = on_attach,
            settings = {
                tsserver_file_preferences = {
                    includeInlayParameterNameHints = 'all',
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true
                },
            }
        }
    }
end
