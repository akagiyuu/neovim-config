vim.keymap.set('n', '<leader>f<Enter>', function() require('telescope.builtin').builtin() end, {
    desc = 'All picker',
})
vim.keymap.set('n', '<leader>fr', function() require('telescope.builtin').resume() end, {
    desc = 'Resume',
})
vim.keymap.set('n', '<leader>f/', function() require('telescope.builtin').current_buffer_fuzzy_find() end, {
    desc = ' Find',
})
vim.keymap.set('n', '<leader>f?', function() require('telescope.builtin').help_tags() end, {
    desc = ' Help',
})
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, {
    desc = 'File',
})
vim.keymap.set('n', '<leader>fw', function() require('telescope.builtin').live_grep() end, {
    desc = 'Live grep',
})
vim.keymap.set('n', '<leader>fgc', function() require('telescope.builtin').git_commits() end, {
    desc = '[g]it [c]ommit',
})
vim.keymap.set('n', '<leader>fgb', function() require('telescope.builtin').git_branches() end, {
    desc = '[g]it [b]ranch',
})
vim.keymap.set('n', '<leader>fgs', function() require('telescope.builtin').git_status() end, {
    desc = '[g]it [s]tatus',
})
vim.keymap.set('n', '<leader>fb', function() require('telescope').extensions.file_browser.file_browser() end, {
    desc = '[f]ile [b]rowser',
})
