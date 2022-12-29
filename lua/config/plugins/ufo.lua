return {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
    config = {
        enable_get_fold_virt_text = true,
        open_fold_hl_timeout = 0,
        -- provider_selector = function(_, _, _) return { 'treesitter', 'indent' } end,
        -- fold_virt_text_handler = handler,
        -- preview = {
        --     win_config = {
        --         winblend = 0,
        --     },
        -- },
        close_fold_kinds = { 'imports', 'regions' }
    }
}
