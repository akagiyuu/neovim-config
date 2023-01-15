local Lsp = {}

Lsp.format = function()
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
Lsp.hover = function()
    local ok, ufo = pcall(require, 'ufo')
    local winid = nil
    if ok then
        winid = ufo.peekFoldedLinesUnderCursor()
    end

    if not winid then
        vim.lsp.buf.hover()
    end
end
Lsp.toggle_virtual_lines = function()
    require('lsp_lines')
    local virtual_lines_enable = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config {
        virtual_lines = virtual_lines_enable,
        virtual_text = not virtual_lines_enable
    }
end

return Lsp
