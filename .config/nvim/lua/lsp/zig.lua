vim.lsp.config['zls'] = {
    cmd = { 'zls' },
    root_markers = { 'build.zig' },
    filetypes = { 'zig' },
}

vim.lsp.enable("zls")
