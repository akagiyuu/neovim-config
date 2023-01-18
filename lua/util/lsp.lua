local _lsp = {}

_lsp.format = function()
    local disable_server = {
        tsserver = true,
        html = true,
    }
    vim.lsp.buf.format {
        async = true,
        filter = function(client)
            if disable_server[client.name] then return false end

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
_lsp.toggle_virtual_lines = function()
    require('lsp_lines')
    local virtual_lines_enable = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config {
        virtual_lines = virtual_lines_enable,
        virtual_text = not virtual_lines_enable
    }
end

_lsp.code_lens_attach = function(client, bufnr)
    local status_ok, codelens_supported = pcall(function()
        return client.supports_method('textDocument/codeLens')
    end)
    if not status_ok or not codelens_supported then
        return
    end

    local event = { 'BufEnter', 'InsertLeave' }
    local ok, autocmds = pcall(vim.api.nvim_get_autocmds, {
        buffer = bufnr,
        event = event,
    })
    if ok and #autocmds > 0 then
        return
    end

    vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
    })
end

return _lsp
