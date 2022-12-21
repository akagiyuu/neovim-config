-- vim.keymap.set('n', '<C-f>', function() require('telescope.builtin').current_buffer_fuzzy_find() end, {
--     desc = 'Find in current buffer',
-- })
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
vim.keymap.set('n', '<leader>fa', function() require('telescope.builtin').autocommands() end, {
    desc = 'Auto commands',
})
vim.keymap.set('n', '<leader>fc', function() require('telescope.builtin').commands() end, {
    desc = ' Commands',
})
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, {
    desc = 'File',
})
vim.keymap.set('n', '<leader>fw', function() require('telescope.builtin').live_grep() end, {
    desc = 'Live grep',
})
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').highlights() end, {
    desc = 'Hightlights',
})
vim.keymap.set('n', '<leader>fk', function() require('telescope.builtin').keymaps() end, {
    desc = 'Keymaps',
})
vim.keymap.set('n', '<leader>fo', function() require('telescope.builtin').oldfiles() end, {
    desc = 'Recently opened files',
})
vim.keymap.set('n', '<leader>ft', function() require('telescope.builtin').filetypes() end, {
    desc = 'Available filetypes',
})
vim.keymap.set('n', '<leader>fv', function() require('telescope.builtin').vim_options() end, {
    desc = 'Vim options',
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
