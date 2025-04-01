vim.lsp.config['clangd'] = {
  cmd = { 'clangd', '--background-index' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  filetypes = { 'c', 'cpp', 'h' },
}

vim.lsp.enable({'clangd'})

# vim.diagnostic.config({ virtual_text = true })
