local M = {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
}

M.config = function()
    -- local function customizeSelector(bufnr)
    --     local function handleFallbackException(err, providerName)
    --         if type(err) == 'string' and err:match('UfoFallbackException') then
    --             return require('ufo').getFolds(providerName, bufnr)
    --         else
    --             return require('promise').reject(err)
    --         end
    --     end
    --
    --     return require('ufo').getFolds('lsp', bufnr):catch(function(err)
    --         return handleFallbackException(err, 'treesitter')
    --     end):catch(function(err)
    --         return handleFallbackException(err, 'indent')
    --     end)
    -- end

    local handler = function(virtText, lnum, endLnum, width, truncate, ctx)
        local new_virtual_text = {}

        local suffix = '   '
        local counts = ('    %d    '):format(endLnum - lnum)
        local end_virt_text = ctx.get_fold_virt_text(endLnum)

        local suffix_width = vim.fn.strdisplaywidth(suffix)
        local target_width = width - suffix_width
        local currrent_width = 0

        for _, chunk in ipairs(virtText) do
            local chunk_text = chunk[1]
            local chunk_width = vim.fn.strdisplaywidth(chunk_text)
            if target_width > currrent_width + chunk_width then
                table.insert(new_virtual_text, chunk)
            else
                chunk_text = truncate(chunk_text, target_width - currrent_width)
                local hightlight_group = chunk[2]
                table.insert(new_virtual_text, { chunk_text, hightlight_group })
                chunk_width = vim.fn.strdisplaywidth(chunk_text)
                -- str width returned from truncate() may less than 2nd argument, need padding
                -- if currrent_width + chunk_width < target_width then
                --     suffix = suffix .. (' '):rep(target_width - currrent_width - chunk_width)
                -- end
                break
            end
            currrent_width = currrent_width + chunk_width
        end

        table.insert(new_virtual_text, { suffix, 'UfoFoldedEllipsis' })
        for _, v in ipairs(end_virt_text) do
            if v[1]:match('%S') then
                table.insert(new_virtual_text, v)
            end
        end

        return new_virtual_text
    end

    require('ufo').setup {
        enable_get_fold_virt_text = true,
        open_fold_hl_timeout = 0,
        -- provider_selector = function(_, _, _) return { 'treesitter', 'indent' } end,
        -- fold_virt_text_handler = handler,
        -- preview = {
        --     win_config = {
        --         winblend = 0,
        --     },
        -- },
        close_fold_kinds = { 'imports', 'regions' }
    }
    vim.keymap.set('n', 'zR', function() require('ufo').openAllFolds() end)
    vim.keymap.set('n', 'zM', function() require('ufo').closeAllFolds() end)
end

return M
