require('config.option')
require('config.lazy')

vim.defer_fn(function()
    require('config.gui')
    require('config.keymap')
    require('config.autocmd')

    vim.cmd.rshada()
    vim.opt.spell = true
    -- require('lspconfig').rust_analyzer.setup {
    --
    --     -- capabilities = capabilities,
    --     -- on_attach = on_attach,
    --     settings = {
    --         ['rust-analyzer'] = {
    --             checkOnSave = {
    --                 command = 'clippy',
    --             },
    --             diagnostics = {
    --                 enable = true,
    --                 experimental = { enable = true }
    --             }
    --         }
    --     }
    -- }
end, 750)
