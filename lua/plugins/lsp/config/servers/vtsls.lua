return function(capabilities)
    return {
        'yioneko/nvim-vtsls',
        ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        config = function()
            require('lspconfig.configs').vtsls = require('vtsls').lspconfig -- set default server config
            require('lspconfig').vtsls.setup {
                capabilities = capabilities,
            }
        end
    }
end
