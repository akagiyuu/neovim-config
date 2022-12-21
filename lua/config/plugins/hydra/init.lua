return {
    'anuvyklack/hydra.nvim',
    event = 'VeryLazy',
    config = function()
        local Hydra = require('hydra')

        Hydra(require('config.plugins.hydra.window'))
        Hydra(require('config.plugins.hydra.debug'))
    end,
}
