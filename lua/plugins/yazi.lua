return {
    'mikavilpas/yazi.nvim',
    keys = {
        {
            -- Open in the current working directory
            '<leader>yb',
            '<cmd>Yazi cwd<cr>',
            desc = "Open the file manager in nvim's working directory",
        },
        {
            '<leader>yr',
            '<cmd>Yazi toggle<cr>',
            desc = 'Resume the last yazi session',
        },
    },
    opts = {
        open_for_directories = false,
        keymaps = {
            show_help = '<f1>',
        },
    },
}
