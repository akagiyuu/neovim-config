return {
    'williamboman/mason.nvim',
    opts = {
        ui = {
            border = 'single',
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
