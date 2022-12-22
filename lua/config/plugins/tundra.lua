local M = {
    'sam4llis/nvim-tundra',
    branch = 'dev',
    lazy = false,
    enabled = false,
}

M.config = function()
    local cp = require('nvim-tundra.palette.arctic')
    require('nvim-tundra').setup {
        transparent_background = true,
        editor = {
            search = {},
            substitute = {},
        },
        syntax = {
            booleans     = { bold = true, italic = true },
            comments     = { bold = true, italic = true },
            conditionals = {},
            constants    = { bold = true },
            functions    = {},
            keywords     = {},
            loops        = {},
            numbers      = { bold = true },
            operators    = { bold = true },
            punctuation  = {},
            strings      = {},
            types        = { italic = true },
        },
        diagnostics = {
            -- errors = { undercurl = true },
            -- warnings = { undercurl = true },
            -- information = { undercurl = true },
            -- hints = { undercurl = true },
        },
        plugins = {
            lsp = true,
            treesitter = true,
            cmp = true,
            context = false,
            dbui = false,
            gitsigns = true,
            telescope = false,
        },
        overwrite = {
            highlights = {
                WhichKeyFloat     = { bg = 'NONE' },
                NormalFloat       = { bg = 'NONE' },
                LspFloatWinNormal = { bg = 'NONE' },
                CursorLine        = { bg = 'NONE' },
                Type              = { fg = cp.indigo._500 },
                Typedef           = { fg = cp.sand._500 },
                StorageClass      = { fg = cp.red._500, italic = true },

                ['@field'] = { fg = cp.sand._500 },
                ['@property'] = { fg = cp.orange._500 },

                ['@macro'] = { fg = cp.opal._500 },
                ['@include'] = { fg = cp.opal._500 },
                ['@operator'] = { fg = cp.sky._500 },
                ['@keyword.operator'] = { fg = cp.sky._500 },
                ['@punctuation.special'] = { fg = cp.red._600 },

                -- ["@float"] = { fg = cp.peach },
                -- ["@number"] = { fg = cp.peach },
                -- ["@boolean"] = { fg = cp.peach },

                ['@constructor'] = { fg = cp.indigo._400 },
                -- ["@constant"] = { fg = cp.peach },
                -- ["@conditional"] = { fg = cp.mauve },
                -- ["@repeat"] = { fg = cp.mauve },
                ['@exception'] = { fg = cp.orange._500 },

                ['@constant.builtin'] = { fg = cp.indigo._400 },
                ['@function.builtin'] = { fg = cp.orange._500, italic = true },
                ['@type.builtin'] = { fg = cp.sand._500, italic = true },
                ['@variable.builtin'] = { fg = cp.red._500, italic = true },

                -- ["@function"] = { fg = cp.blue },
                ['@function.macro'] = { fg = cp.red._500, },
                ['@parameter'] = { fg = cp.red._400 },
                ['@keyword.function'] = { fg = cp.red._600 },
                ['@keyword'] = { fg = cp.red._500 },
                ['@keyword.return'] = { fg = cp.opal._500, },

                -- ["@text.note"] = { fg = cp.base, bg = cp.blue },
                -- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
                -- ["@text.danger"] = { fg = cp.base, bg = cp.red },
                -- ["@constant.macro"] = { fg = cp.mauve },

                -- ["@label"] = { fg = cp.blue },
                ['@method'] = { italic = true },
                ['@namespace'] = { fg = cp.red._400, },

                ['@punctuation.delimiter'] = { fg = cp.opal._500 },
                -- ['@punctuation.bracket'] = { fg = cp.overlay2 },
                -- ["@string"] = { fg = cp.green },
                -- ["@string.regex"] = { fg = cp.peach },
                -- ["@type"] = { fg = cp.yellow },
                -- ['@variable'] = { fg = cp.text },
                ['@tag.attribute'] = { fg = cp.indigo._400, italic = true },
                ['@tag'] = { fg = cp.orange._500 },
                ['@tag.delimiter'] = { fg = cp.red._600 },

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

                -- ['@function.builtin.bash'] = { fg = cp.red, italic = true },
                -- ['@parameter.bash'] = { fg = cp.yellow, italic = true },
                --
                -- ['@field.lua'] = { fg = cp.lavender },
                -- ['@constructor.lua'] = { fg = cp.flamingo },
                --
                -- ['@constant.java'] = { fg = cp.teal },
                --
                -- ['@property.typescript'] = { fg = cp.lavender, italic = true },
                -- -- ["@constructor.typescript"] = { fg = cp.lavender },
                --
                -- -- ["@constructor.tsx"] = { fg = cp.lavender },
                -- -- ["@tag.attribute.tsx"] = { fg = cp.mauve },
                --
                -- ['@type.css'] = { fg = cp.lavender },
                -- ['@property.css'] = { fg = cp.yellow, italic = true },
                --
                -- ['@property.cpp'] = { fg = cp.text },

                -- ["@symbol"] = { fg = cp.flamingo },

            },
        },
    }
    vim.opt.background = 'dark'
    vim.cmd.colorscheme('tundra')
end

return M
