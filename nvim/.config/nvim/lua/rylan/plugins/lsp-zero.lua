return {
    'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
    config = function()
        local lsp = require('lsp-zero')
        lsp.preset('recommended')
    end
}
    

