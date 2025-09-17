vim.lsp.config['rust-analyzer'] = {
    cmd = { '/usr/lib/rustup/bin/rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', 'rust-project.json' },
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                targetDir = "/tmp/rust-analyzer-target",
                allFeatures = false,
                autoreload = false,
            },
        }
    }
}

vim.lsp.enable("rust-analyzer")
