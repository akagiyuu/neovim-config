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
            blink_cmp = true,
            flash = true,
            gitsigns = true,
            harpoon = true,
            lsp_saga = true,
            markdown = true,
            noice = true,
            render_markdown = true,
            snacks = true,
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
        highlight_overrides = {
            all = function(colors)
                local overrides = {
                    Comment           = { fg = colors.overlay0, style = { 'italic' } },
                    ['@markup.quote'] = { fg = colors.maroon, style = { 'italic' } }, -- block quotes
                }
                return overrides
            end,
            mocha = function(colors)
                local overrides = {
                    Headline                       = { style = { 'bold' } },
                    FloatTitle                     = { fg = colors.green },
                    WinSeparator                   = { fg = colors.surface1, style = { 'bold' } },
                    CursorLineNr                   = { fg = colors.lavender, style = { 'bold' } },
                    KazCodeBlock                   = { bg = colors.mantle },
                    LeapBackdrop                   = { link = 'MiniJump2dDim' },
                    LeapLabel                      = { fg = colors.green, style = { 'bold' } },
                    MsgArea                        = { fg = colors.overlay2 },
                    CmpItemAbbrMatch               = { fg = colors.green, style = { 'bold' } },
                    CmpItemAbbrMatchFuzzy          = { fg = colors.green, style = { 'bold' } },

                    -- Mini customizations
                    MiniClueDescGroup              = { fg = colors.mauve },
                    MiniClueDescSingle             = { fg = colors.sapphire },
                    MiniClueNextKey                = { fg = colors.yellow },
                    MiniClueNextKeyWithPostkeys    = { fg = colors.red, style = { 'bold' } },

                    MiniFilesCursorLine            = { fg = nil, bg = colors.surface0, style = { 'bold' } },
                    MiniFilesFile                  = { fg = colors.overlay2 },
                    MiniFilesTitleFocused          = { fg = colors.sky, style = { 'bold' } },

                    MiniHipatternsFixmeBody        = { fg = colors.red, bg = colors.base },
                    MiniHipatternsFixmeColon       = { bg = colors.red, fg = colors.red, style = { 'bold' } },
                    MiniHipatternsHackBody         = { fg = colors.yellow, bg = colors.base },
                    MiniHipatternsHackColon        = { bg = colors.yellow, fg = colors.yellow, style = { 'bold' } },
                    MiniHipatternsNoteBody         = { fg = colors.sky, bg = colors.base },
                    MiniHipatternsNoteColon        = { bg = colors.sky, fg = colors.sky, style = { 'bold' } },
                    MiniHipatternsTodoBody         = { fg = colors.teal, bg = colors.base },
                    MiniHipatternsTodoColon        = { bg = colors.teal, fg = colors.teal, style = { 'bold' } },

                    MiniIndentscopeSymbol          = { fg = colors.sapphire },

                    MiniJump                       = { bg = colors.green, fg = colors.base, style = { 'bold' } },
                    MiniJump2dSpot                 = { fg = colors.peach },
                    MiniJump2dSpotAhead            = { fg = colors.mauve },
                    MiniJump2dSpotUnique           = { fg = colors.peach },

                    MiniMapNormal                  = { fg = colors.overlay2, bg = colors.mantle },

                    MiniPickMatchCurrent           = { fg = nil, bg = colors.surface0, style = { 'bold' } },
                    MiniPickMatchRanges            = { fg = colors.green, style = { 'bold' } },
                    MiniPickNormal                 = { fg = colors.overlay2, bg = colors.mantle },
                    MiniPickPrompt                 = { fg = colors.sky, style = { 'bold' } },

                    MiniStarterHeader              = { fg = colors.sapphire },
                    MiniStarterInactive            = { fg = colors.surface2, style = {} },
                    MiniStarterItem                = { fg = colors.overlay2, bg = nil },
                    MiniStarterItemBullet          = { fg = colors.surface2 },
                    MiniStarterItemPrefix          = { fg = colors.pink },
                    MiniStarterQuery               = { fg = colors.red, style = { 'bold' } },
                    MiniStarterSection             = { fg = colors.peach, style = { 'bold' } },

                    MiniStatuslineDirectory        = { fg = colors.overlay1, bg = colors.surface0 },
                    MiniStatuslineFilename         = { fg = colors.text, bg = colors.surface0, style = { 'bold' } },
                    MiniStatuslineFilenameModified = { fg = colors.blue, bg = colors.surface0, style = { 'bold' } },
                    MiniStatuslineInactive         = { fg = colors.overlay1, bg = colors.surface0 },

                    MiniSurround                   = { fg = nil, bg = colors.yellow },

                    MiniTablineCurrent             = { fg = colors.yellow, bg = colors.base, style = { 'bold' } },
                    MiniTablineFill                = { bg = colors.mantle },
                    MiniTablineHidden              = { fg = colors.overlay1, bg = colors.surface0 },
                    MiniTablineModifiedCurrent     = { fg = colors.base, bg = colors.yellow, style = { 'bold' } },
                    MiniTablineModifiedHidden      = { fg = colors.base, bg = colors.subtext0 },
                    MiniTablineModifiedVisible     = { fg = colors.base, bg = colors.subtext0, style = { 'bold' } },
                    MiniTablineTabpagesection      = { fg = colors.base, bg = colors.mauve, style = { 'bold' } },
                    MiniTablineVisible             = { fg = colors.overlay1, bg = colors.surface0, style = { 'bold' } },
                }
                for _, hl in ipairs { 'Headline', 'rainbow' } do
                    for i, c in ipairs { 'green', 'sapphire', 'mauve', 'peach', 'red', 'yellow' } do
                        overrides[hl .. i] = { fg = colors[c], style = { 'bold' } }
                    end
                end
                return overrides
            end,
        }
    },
    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd.colorscheme('catppuccin')
    end
}
