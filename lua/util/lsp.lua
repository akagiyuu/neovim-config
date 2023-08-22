local _lsp = {}


local function range_from_selection()
    -- TODO: Use `vim.region()` instead https://github.com/neovim/neovim/pull/13896
    local start_row = vim.fn.getpos('v')[2]
    local end_row = vim.fn.getpos('.')[2]

    -- A user can start visual selection at the end and move backwards
    -- Normalize the range to start < end
    if end_row < start_row then
        start_row, end_row = end_row, start_row
    end
    return {
        ['start'] = start_row,
        ['end'] = end_row,
    }
end
_lsp.format = function()
    local disable_server = {
        -- tsserver = true,
        html = true,
    }
    vim.lsp.buf.format {
        async = true,
        filter = function(client)
            if disable_server[client.name] then return false end

            return true
        end,
    }

    local range = range_from_selection()
    vim.cmd(string.format('%s,%sFormat', range.start, range['end']))
end
_lsp.hover = function()
    local ok, ufo = pcall(require, 'ufo')
    local winid = nil
    if ok then
        winid = ufo.peekFoldedLinesUnderCursor()
    end

    if not winid then
        vim.lsp.buf.hover()
    end
end

_lsp.code_lens_attach = function(client, bufnr)
    local status_ok, codelens_supported = pcall(function()
        return client.supports_method('textDocument/codeLens')
    end)
    if not status_ok or not codelens_supported then
        return
    end

    local event = { 'BufEnter', 'InsertLeave' }
    local group = 'lsp_code_lens_refresh'
    local ok, autocmds = pcall(vim.api.nvim_get_autocmds, {
        buffer = bufnr,
        event = event,
        group = group,
    })
    if ok and #autocmds > 0 then
        return
    end

    vim.api.nvim_create_augroup(group, { clear = false })
    vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
            vim.lsp.codelens.refresh()
        end
    })
end

_lsp.inlay_hint_attach = function(client, bufnr)
    if client.supports_method('textDocument/inlayHint') then
        vim.lsp.inlay_hint(bufnr, true)
    end
end

return _lsp
