local debug = require(... .. '.debug')

return {
    'anuvyklack/hydra.nvim',
    keys = {
        { '<leader>d' }
    },
    config = function()
        local Hydra = require('hydra')

        Hydra(debug)
    end,
}
