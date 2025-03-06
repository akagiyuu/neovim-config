vim.uv.os_setenv('JAVA_HOME', '/usr/lib/jvm/java-21-openjdk')
local config = {
    cmd = { 'jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
