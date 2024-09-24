local config = {
    cmd = { 'jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    settings = {
        java = {
            format = {
                settings = {
                    url = '~/.config/java/eclipse-java-google-style.xml',
                    profile = 'GoogleStyle',
                }
            }
        }

    }
}
require('jdtls').start_or_attach(config)
