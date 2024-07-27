local lspconfig = require('lspconfig')

lspconfig.qmlls.setup {
    cmd = { 'qmlls' },
    filetypes = { 'qml' },
    root_dir = lspconfig.util.root_pattern('*.qmlproject', '.git'),
    settings = {
        qml = {
        }
    }
}
