local M = {
    'jose-elias-alvarez/typescript.nvim',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
}

M.config = function()
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
            capabilities = require('config.plugins.lspconfig.capabilities'),
            on_attach = require('config.plugins.lspconfig.on_attach')
        },
    }
end

return M
