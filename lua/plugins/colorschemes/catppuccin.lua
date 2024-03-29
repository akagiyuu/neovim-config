return {
    'catppuccin/nvim',
    name = 'catppuccin',
    build = ':CatppuccinCompile',
    lazy = false,
    enabled = true,
    priority = 1000,
    default_integrations = true,
    opts = {
        flavour = 'mocha',
        transparent_background = true,
        styles = {
            comments = { 'italic' },
            properties = { 'italic' },
            functions = { 'bold' },
            keywords = { 'italic' },
            operators = { 'bold' },
            conditionals = { 'bold' },
            loops = { 'bold' },
            booleans = { 'bold', 'italic' },
            numbers = {},
            types = {},
            strings = {},
            variables = {},
        },
        integrations = {
            flash = true,
            gitsigns = true,
            harpoon = true,
            headlines = true,
            indent_blankline = {
                enabled = true,
                scope_color = '', -- catppuccin color (eg. `lavender`) Default: text
                colored_indent_levels = false,
            },
            lsp_saga = true,
            markdown = true,
            noice = true,
            cmp = true,
            dap = true,
            dap_ui = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { 'italic' },
                    hints = { 'italic' },
                    warnings = { 'italic' },
                    information = { 'italic' },
                },
                underlines = {
                    errors = { 'undercurl' },
                    hints = { 'undercurl' },
                    warnings = { 'undercurl' },
                    information = { 'undercurl' },
                },
                inlay_hints = {
                    background = true,
                },
            },
            notify = true,
            semantic_tokens = true,
            treesitter = true,
            ufo = true,
            rainbow_delimiters = true,
            telescope = {
                enabled = true,
                style = 'nvchad'
            },
            which_key = true
        },
        color_overrides = {
            -- mocha = {
            --     rosewater = '#EA6962',
            --     flamingo = '#EA6962',
            --     pink = '#D3869B',
            --     mauve = '#D3869B',
            --     red = '#EA6962',
            --     maroon = '#EA6962',
            --     peach = '#BD6F3E',
            --     yellow = '#D8A657',
            --     green = '#A9B665',
            --     teal = '#89B482',
            --     sky = '#89B482',
            --     sapphire = '#89B482',
            --     blue = '#7DAEA3',
            --     lavender = '#7DAEA3',
            --     text = '#D4BE98',
            --     subtext1 = '#BDAE8B',
            --     subtext0 = '#A69372',
            --     overlay2 = '#8C7A58',
            --     overlay1 = '#735F3F',
            --     overlay0 = '#5A4525',
            --     surface2 = '#4B4F51',
            --     surface1 = '#2A2D2E',
            --     surface0 = '#232728',
            --     base = '#1D2021',
            --     mantle = '#191C1D',
            --     crust = '#151819',
            -- },
            -- mocha = { -- custom
            --     rosewater = '#ffc6be',
            --     flamingo = '#fb4934',
            --     pink = '#ff75a0',
            --     mauve = '#d3869b',
            --     red = '#f2594b',
            --     maroon = '#fe8019',
            --     peach = '#FFAD7D',
            --     yellow = '#d79921', -- "#DEB22C",
            --     green = '#a9b665',
            --     teal = '#8ec07c',
            --     sky = '#7daea3',
            --     sapphire = '#689d6a',
            --     blue = '#6d8dad',
            --     lavender = '#b16286',
            --     text = '#fbf1c7', -- #D4BE98  #C6D0F5
            --     subtext1 = '#d5c4a1', -- #BDAE8B  #B3BCDF
            --     subtext0 = '#a89984', -- #A69372  #A1A8C9
            --     overlay2 = '#8C7A58', -- #8E95B3
            --     overlay1 = '#735F3F', -- #7B819D
            --     overlay0 = '#806234', -- #696D86
            --     surface2 = '#665c54', -- #6E7477  #4B4F51  #565970
            --     surface1 = '#3c3836', -- #2A2D2E           #43465A
            --     surface0 = '#32302f', -- #232728           #313244
            --     base = '#282828', -- #1D2021           #1E1E2E
            --     mantle = '#1d2021', -- #191C1D           #181825
            --     crust = '#1b1b1b', --                   #11111B
            -- },
            mocha = {
                rosewater = '#F5B8AB',
                flamingo = '#F29D9D',
                pink = '#AD6FF7',
                mauve = '#FF8F40',
                red = '#E66767',
                maroon = '#EB788B',
                peach = '#FAB770',
                yellow = '#FACA64',
                green = '#70CF67',
                teal = '#4CD4BD',
                sky = '#61BDFF',
                sapphire = '#4BA8FA',
                blue = '#00BFFF',
                lavender = '#00BBCC',
                text = '#C1C9E6',
                subtext1 = '#A3AAC2',
                subtext0 = '#8E94AB',
                overlay2 = '#7D8296',
                overlay1 = '#676B80',
                overlay0 = '#464957',
                surface2 = '#3A3D4A',
                surface1 = '#2F313D',
                surface0 = '#1D1E29',
                base = '#0b0b12',
                mantle = '#11111a',
                crust = '#191926',
            },
        },
    },
    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd.colorscheme('catppuccin')
    end
}
