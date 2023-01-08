return {
    'anuvyklack/hydra.nvim',
    event = 'VeryLazy',
    config = function()
        local Hydra = require('hydra')

        Hydra(require('plugins.hydra.window'))
        Hydra(require('plugins.hydra.debug'))
    end,
}
