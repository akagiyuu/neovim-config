local _lsp = {}

_lsp.format = function()
    local defined_types = require('formatter.config').values.filetype
    vim.lsp.buf.format {
        async = true,
        filter = function()
            if defined_types[vim.bo.filetype] ~= nil then
                return false
            end
            return true
        end,
    }
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
