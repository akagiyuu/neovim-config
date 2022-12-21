local utils = require('heirline.utils')

local setup_colors = function()
    return {
        white         = '#b5bcc9',
        red           = utils.get_highlight('DiagnosticError').fg,
        red_dark      = utils.get_highlight('DiffDelete').bg,
        green         = utils.get_highlight('String').fg,
        green_pale    = utils.get_highlight('DiagnosticHint').fg,
        blue          = utils.get_highlight('Function').fg,
        nord_blue     = utils.get_highlight('DiagnosticInfo').fg,
        grey          = utils.get_highlight('NonText').fg,
        orange        = utils.get_highlight('Constant').fg,
        purple        = utils.get_highlight('Statement').fg,
        cyan          = utils.get_highlight('Special').fg,
        yellow        = utils.get_highlight('DiagnosticWarn').fg,
        short_bg      = '#34393D',
        statusline_bg = '#181f26',
        light_bg      = '#222930',
        mid_bg        = '#2B3033',
        diag_warn     = utils.get_highlight('DiagnosticWarn').fg,
        diag_error    = utils.get_highlight('DiagnosticError').fg,
        diag_hint     = utils.get_highlight('DiagnosticHint').fg,
        diag_info     = utils.get_highlight('DiagnosticInfo').fg,
        git_del       = utils.get_highlight('GitSignsDelete').fg,
        git_add       = utils.get_highlight('GitSignsAdd').fg,
        git_change    = utils.get_highlight('GitSignsChange').fg,
    }
end

require('heirline').load_colors(setup_colors())
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local colors = setup_colors()
        utils.on_colorscheme(colors)
    end,
})
