return {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    config = {
        ui = {
            border = 'single',
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗'
            }
        }
    },
}
