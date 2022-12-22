return {
    'catppuccin/nvim',
    name = 'catppuccin',
    build = ':CatppuccinCompile',
    lazy = false,
    enabled = true,
    config = function()
        require('catppuccin').setup {
            flavour = 'mocha',
            transparent_background = true,
            term_colors = true,
            compile = { enabled = true },
            styles = {
                comments     = { 'italic' },
                properties   = { 'italic' },
                functions    = { 'italic', 'bold' },
                keywords     = { 'italic' },
                operators    = { 'bold' },
                conditionals = { 'bold' },
                loops        = { 'bold' },
                booleans     = { 'bold', 'italic' },
                types        = { 'bold' },
            },
            color_overrides = {
                mocha = {
                    rosewater = '#F5E0DC',
                    flamingo = '#F2CDCD',
                    mauve = '#DDB6F2',
                    pink = '#F5C2E7',
                    red = '#F28FAD',
                    maroon = '#E8A2AF',
                    peach = '#F8BD96',
                    yellow = '#FAE3B0',
                    green = '#ABE9B3',
                    blue = '#96CDFB',
                    sky = '#89DCEB',
                    teal = '#B5E8E0',
                    lavender = '#C9CBFF',

                    text = '#D9E0EE',
                    subtext1 = '#BAC2DE',
                    subtext0 = '#A6ADC8',
                    overlay2 = '#C3BAC6',
                    overlay1 = '#988BA2',
                    overlay0 = '#6E6C7E',
                    surface2 = '#6E6C7E',
                    surface1 = '#575268',
                    surface0 = '#302D41',

                    base = '#1E1E2E',
                    mantle = '#1A1826',
                    crust = '#161320',
                },
                -- mocha = {
                --     text = "#F4CDE9",
                --     subtext1 = "#DEBAD4",
                --     subtext0 = "#C8A6BE",
                --     overlay2 = "#B293A8",
                --     overlay1 = "#9C7F92",
                --     overlay0 = "#866C7D",
                --     surface2 = "#705867",
                --     surface1 = "#5A4551",
                --     surface0 = "#44313B",
                --
                --     base = "#352939",
                --     mantle = "#211924",
                --     crust = "#1a1016",
                -- },
            },
            integrations = {
                cmp = true,
                dashboard = false,
                gitsigns = true,
                lightspeed = true,
                lsp_saga = true,
                lsp_trouble = true,
                markdown = true,
                notify = true,
                nvimtree = true,
                telescope = true,
                treesitter = true,
                treesitter_context = false,
                which_key = true,
                dap = {
                    enabled = true,
                    enable_ui = true,
                },
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = false,
                },
                native_lsp = {
                    underlines = {
                        errors      = { 'undercurl' },
                        hints       = { 'undercurl' },
                        warnings    = { 'undercurl' },
                        information = { 'undercurl' },
                    },
                },
                noice = true,
            },
            highlight_overrides = {
                mocha = function(cp)
                    return {
                        Keyword = { fg = cp.pink },
                        Type = { fg = cp.blue },
                        Typedef = { fg = cp.yellow },
                        StorageClass = { fg = cp.red, style = { 'italic' } },
                        ['@defaultLibrary'] = { link = '@function.builtin' },
                        ['@enummember'] = { link = '@constant', style = { 'italic', 'bold' } },
                        ['@documentation'] = { style = { 'bold' } },
                        ['@deprecated'] = { style = { 'strikethrough' } },
                        ['@static'] = { fg = cp.green, style = { 'bold' } },

                        ['@field'] = { fg = cp.rosewater },
                        ['@property'] = { fg = cp.yellow },

                        ['@macro'] = { fg = cp.teal, style = {} },
                        ['@include'] = { fg = cp.teal },
                        ['@operator'] = { fg = cp.sky },
                        ['@keyword.operator'] = { fg = cp.sky },
                        ['@punctuation.special'] = { fg = cp.maroon },

                        -- ["@float"] = { fg = cp.peach },
                        -- ["@number"] = { fg = cp.peach },
                        -- ["@boolean"] = { fg = cp.peach },

                        ['@constructor'] = { fg = cp.lavender },
                        -- ["@constant"] = { fg = cp.peach },
                        -- ["@conditional"] = { fg = cp.mauve },
                        -- ["@repeat"] = { fg = cp.mauve },
                        ['@exception'] = { fg = cp.peach },

                        ['@constant.builtin'] = { fg = cp.lavender },
                        ['@function.builtin'] = { fg = cp.peach, style = { 'italic' } },
                        ['@type.builtin'] = { fg = cp.yellow, style = { 'italic' } },
                        ['@variable.builtin'] = { fg = cp.red, style = { 'italic' } },

                        -- ["@function"] = { fg = cp.blue },
                        ['@function.macro'] = { fg = cp.red, style = {} },
                        ['@parameter'] = { fg = cp.rosewater },
                        ['@keyword.function'] = { fg = cp.maroon },
                        ['@keyword'] = { fg = cp.red },
                        ['@keyword.return'] = { fg = cp.pink, style = {} },

                        -- ["@text.note"] = { fg = cp.base, bg = cp.blue },
                        -- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
                        -- ["@text.danger"] = { fg = cp.base, bg = cp.red },
                        -- ["@constant.macro"] = { fg = cp.mauve },

                        -- ["@label"] = { fg = cp.blue },
                        ['@method'] = { style = { 'italic' } },
                        ['@namespace'] = { fg = cp.rosewater, style = {} },

                        ['@punctuation.delimiter'] = { fg = cp.teal },
                        ['@punctuation.bracket'] = { fg = cp.overlay2 },
                        -- ["@string"] = { fg = cp.green },
                        -- ["@string.regex"] = { fg = cp.peach },
                        -- ["@type"] = { fg = cp.yellow },
                        ['@variable'] = { fg = cp.text },
                        ['@tag.attribute'] = { fg = cp.mauve, style = { 'italic' } },
                        ['@tag'] = { fg = cp.peach },
                        ['@tag.delimiter'] = { fg = cp.maroon },
                        ['@text'] = { fg = cp.text },

                        -- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
                        -- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
                        -- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
                        -- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
                        -- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
                        -- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
                        -- ["@string.escape"] = { fg = cp.pink },

                        -- ["@property.toml"] = { fg = cp.blue },
                        -- ["@field.yaml"] = { fg = cp.blue },

                        -- ["@label.json"] = { fg = cp.blue },

                        ['@function.builtin.bash'] = { fg = cp.red, style = { 'italic' } },
                        ['@parameter.bash'] = { fg = cp.yellow, style = { 'italic' } },

                        ['@field.lua'] = { fg = cp.lavender },
                        ['@constructor.lua'] = { fg = cp.flamingo },

                        ['@constant.java'] = { fg = cp.teal },

                        ['@property.typescript'] = { fg = cp.lavender, style = { 'italic' } },
                        -- ["@constructor.typescript"] = { fg = cp.lavender },

                        -- ["@constructor.tsx"] = { fg = cp.lavender },
                        -- ["@tag.attribute.tsx"] = { fg = cp.mauve },

                        ['@type.css'] = { fg = cp.lavender },
                        ['@property.css'] = { fg = cp.yellow, style = { 'italic' } },

                        ['@property.cpp'] = { fg = cp.text },

                        -- ["@symbol"] = { fg = cp.flamingo },
                    }
                end,
            },
            custom_highlights = {
                LspFloatWinNormal       = { bg = 'NONE' },
                TreesitterContextBottom = { underline = true, sp = '#6E6C7E', }
            },
        }
        vim.g.catppuccin_flavour = 'mocha'
        vim.cmd.colorscheme('catppuccin')
    end
}
