return {
    'ibhagwan/fzf-lua',
    opts = {
        { 'default-title' }, -- base profile
        fzf_opts   = { ['--layout'] = 'default', ['--marker'] = '+' },
        winopts    = {
            width   = 0.8,
            height  = 0.9,
            preview = {
                hidden       = 'nohidden',
                vertical     = 'up:45%',
                horizontal   = 'right:50%',
                layout       = 'flex',
                flip_columns = 120,
                delay        = 10,
                winopts      = { number = false },
            },
        },
        files      = {
            git_icons = false,
        },
        previewers = {
            builtin = {
                extensions = {
                    ['png'] = { 'viu', '-b' },
                    ['jpg'] = { 'viu', '-b' },
                }
            }
        }
    },
    keys = {
        { '<leader>fb', '<cmd>FzfLua buffers<cr>',   desc = 'Buffers' },
        { '<leader>ff', '<cmd>FzfLua files<cr>',     desc = 'Find Files' },
        { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep' },
        { '<leader>fk', '<cmd>FzfLua keymaps<cr>',   desc = 'Key Maps' },
        { '<leader>fr', '<cmd>FzfLua resume<cr>',    desc = 'Resume' },
        { '<leader>fq', '<cmd>FzfLua quickfix<cr>',  desc = 'Quickfix List' },
    },
}
