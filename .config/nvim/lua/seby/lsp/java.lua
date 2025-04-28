local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.env.HOME .. '/jdtls-workspace' .. project_name


vim.lsp.config['jdtls'] = {
    cmd = {
        'jdtls',
        '-data', workspace_dir,
    },
    root_markers = { 'pom.xml', '.git' },
    filetypes = { 'java' },
}

vim.lsp.enable("jdtls")
