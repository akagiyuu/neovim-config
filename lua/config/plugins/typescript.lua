return {
    'jose-elias-alvarez/typescript.nvim',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    config = function()
        require('typescript').setup {
            server = { -- pass options to lspconfig's setup method
                --  settings = {
                --      javascript = {
                --          inlayHints = {
                --              includeInlayEnumMemberValueHints = true,
                --              includeInlayFunctionLikeReturnTypeHints = true,
                --              includeInlayFunctionParameterTypeHints = true,
                --              includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
                --              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                --              includeInlayPropertyDeclarationTypeHints = true,
                --              includeInlayVariableTypeHints = true,
                --          },
                --      },
                --      typescript = {
                --          inlayHints = {
                --              includeInlayEnumMemberValueHints = true,
                --              includeInlayFunctionLikeReturnTypeHints = true,
                --              includeInlayFunctionParameterTypeHints = true,
                --              includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
                --              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                --              includeInlayPropertyDeclarationTypeHints = true,
                --              includeInlayVariableTypeHints = true,
                --          },
                --      },
                -- },
                capabilities = require('plugins.config.lspconfig.capabilities'),
                on_attach = require('plugins.config.lspconfig.on_attach')
            },
        }
    end
}
