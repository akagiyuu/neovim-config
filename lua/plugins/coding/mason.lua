return {
    'williamboman/mason.nvim',
    opts = {
        ui = {
            border = 'rounded',
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗'
            }
        },
        pip = {
            upgrade_pip = true,
        }
    },
}
