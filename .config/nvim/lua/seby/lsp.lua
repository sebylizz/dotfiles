function set_keymap(opts)
    local mode = opts.mode or "n"
    local bufnr = opts.bufnr or 0
    local expr = opts.expr or false

    vim.keymap.set(
        mode,
        opts.key,
        opts.cmd,
        {
            expr = expr,
            buffer = bufnr,
            noremap = true,
            silent = true,
            desc = opts.desc,
        }
    )
end

local function set_global_keymaps(client, bufnr)
    -- Restart LSP
    set_keymap({
        key = '<leader>lr',
        cmd = ":LspRestart<CR>",
        desc = "Restart LSP server",
        bufnr = bufnr,
    })

    -- Go to definition
    set_keymap({
        key = 'gd',
        cmd = ":Telescope lsp_definitions<CR>",
        desc = "Go to definition",
        bufnr = bufnr,
    })

    -- Go to type definition
    set_keymap({
        key = 'gt',
        cmd = ":Telescope lsp_type_definitions<CR>",
        desc = "Go to type definition",
        bufnr = bufnr,
    })

    if client:supports_method('textDocument/declaration') then
        -- Go to declaration
        set_keymap({
            key = 'gD',
            cmd = vim.lsp.buf.declaration,
            desc = "Go to declaration",
            bufnr = bufnr,
        })
    end

    -- Float diagnostics
    set_keymap({
        key = '<leader>D',
        cmd = ":Telescope diagnostics bufnr=0<CR>",
        desc = "Show diagnostics for current buffer",
        bufnr = bufnr,
    })

    -- Show hover information
    set_keymap({
        key = 'K',
        cmd = vim.lsp.buf.hover,
        desc = "Show hover information",
        bufnr = bufnr,
    })

    -- Go to implementation
    set_keymap({
        key = 'gi',
        cmd = ":Telescope lsp_implementations<CR>",
        desc = "Go to implementation",
        bufnr = bufnr,
    })

    -- Show signature help
    set_keymap({
        key = '<C-k>',
        cmd = vim.lsp.buf.signature_help,
        desc = "Show signature help",
        bufnr = bufnr,
    })

    -- Rename symbol
    set_keymap({
        key = '<leader>rn',
        cmd = vim.lsp.buf.rename,
        desc = "Rename symbol",
        bufnr = bufnr,
    })

    -- Code actions
    set_keymap({
        key = '<leader>ca',
        cmd = vim.lsp.buf.code_action,
        desc = "Show code actions",
        bufnr = bufnr,
    })

    -- Go to references
    set_keymap({
        key = 'gr',
        cmd = ":Telescope lsp_references<CR>",
        desc = "Go to references",
        bufnr = bufnr,
    })

    -- Show line diagnostics in a floating window
    set_keymap({
        key = '<leader>ld',
        cmd = vim.diagnostic.open_float,
        desc = "Show line diagnostics",
        bufnr = bufnr,
    })

    -- Go to previous diagnostic
    set_keymap({
        key = '[d',
        cmd = function()
            vim.diagnostic.jump({ count = -1 })
        end,
        desc = "Go to previous diagnostic",
        bufnr = bufnr,
    })

    -- Go to next diagnostic
    set_keymap({
        key = ']d',
        cmd = function()
            vim.diagnostic.jump({ count = 1 })
        end,
        desc = "Go to next diagnostic",
        bufnr = bufnr,
    })

    -- Format document
    set_keymap({
        key = '<leader>fa',
        cmd = function()
            vim.lsp.buf.format({ async = true })
        end,
        desc = "Format document",
        bufnr = bufnr,
    })
end

local function configure_diagnostics()
    vim.diagnostic.config({
        virtual_text = { current_line = true },
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.INFO] = "",
                [vim.diagnostic.severity.HINT] = "",
            },
        },
        float = {
            border = "rounded",
            source = "if_many",
        },
    })
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('global.lsp', { clear = true }),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local bufnr = args.buf

        set_global_keymaps(client, bufnr)
        configure_diagnostics()
    end
})

vim.lsp.config('*', {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

local lsp_path = vim.fn.stdpath("config") .. "/lua/seby/lsp"

for _, file in ipairs(vim.fn.readdir(lsp_path)) do
    require("seby.lsp." .. file:gsub("%.lua$", ""))
end
