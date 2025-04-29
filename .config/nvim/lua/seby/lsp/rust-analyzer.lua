vim.lsp.config['rust-analyzer'] = {
    cmd = { 'rust-analyzer' },
    root_markers = { 'cargo.toml' },
    filetypes = { 'rust' }
}

vim.lsp.enable("rust-analyzer")
