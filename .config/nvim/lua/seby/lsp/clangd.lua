vim.lsp.config['clangd'] = {
    cmd = { 'clangd' },
    root_markers = { 'compile_commands.json', 'compile_flags.txt' },
    filetypes = { 'c', 'cpp', 'h' },
}

vim.lsp.enable("clangd")
