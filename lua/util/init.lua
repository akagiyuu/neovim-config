local util = {}
local api = vim.api
local fn = vim.fn

---Set cursor to previous position
util.setCursorPosition = function()
    -- Return if the file doesn't exist, like a new and unsaved file
    if fn.empty(fn.glob(fn.expand('%'))) ~= 0 then
        return
    end

    local cursor_position = api.nvim_buf_get_mark(0, '"')
    local row = cursor_position[1]

    if row > 0 and row <= api.nvim_buf_line_count(0) then
        -- If the last row is visible within this window, like in a very short
        -- file, just set the cursor position to the saved position
        api.nvim_win_set_cursor(0, cursor_position)

        if api.nvim_buf_line_count(0) - row > ((fn.line('w$') - fn.line('w0')) / 2) - 1 then
            api.nvim_input('zz')
        end
    end

    -- If the row is within a fold, make the row visible and recenter the screen
    if api.nvim_eval("foldclosed('.')") ~= -1 then
        api.nvim_input('zvzz')
    end
end
function util.smart_quit()
    local bufnr = vim.api.nvim_get_current_buf()
    local modified = vim.api.nvim_buf_get_option(bufnr, 'modified')
    if not modified then
        vim.cmd 'q!'
    end
    vim.ui.input({ prompt = 'You have unsaved changes. Quit anyway? (y/n) ' }, function(input)
        if input == 'y' then
            vim.cmd 'q!'
        end
    end)
end

util.lsp = require(... .. '.lsp')

--- Set vim options with a nested table like API with the format vim.<first_key>.<second_key>.<value>
-- @param options the nested table of vim options
util.vim_opts = function(options)
    for scope, table in pairs(options) do
        for setting, value in pairs(table) do
            vim[scope][setting] = value
        end
    end
end

return util
