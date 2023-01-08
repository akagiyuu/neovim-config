local window = require(... .. '.window')
local debug = require(... .. '.debug')

return {
    'anuvyklack/hydra.nvim',
    event = 'VeryLazy',
    config = function()
        local Hydra = require('hydra')

        Hydra(window)
        Hydra(debug)
    end,
}
