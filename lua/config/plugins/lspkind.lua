return {
    'onsails/lspkind.nvim',
    config = function()
        require('lspkind').init {
            preset = 'codicons',
            mode = 'symbol',
            symbol_map = {
                Constructor = '',
                Key = '',
                Null = 'NULL',
                Object = '⦿',
                Package = '',
                Property = '',
                Reference = '',
                Snippet = '',
                String = '𝓐',
                TypeParameter = '',
                Unit = '',
            },
        }
    end,
}
