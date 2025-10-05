vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/dariuscorvus/tree-sitter-surrealdb.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/zbirenbaum/copilot.lua" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/EdenEast/nightfox.nvim" },
})

vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false
vim.cmd("language en_US.UTF-8")

require("nightfox").setup {
    palettes = {
        duskfox = {
            bg1 = "#111111",
            bg3 = "#222222",
        }
    }
}
vim.cmd.colorscheme("duskfox")

local builtin = require("telescope.builtin")

require("blink.cmp").setup()
require('nvim-treesitter.configs').setup { sync_install = false, auto_install = true, ensure_installed = { "lua", "svelte", "typescript", "rust", "html", "css", "javascript", "json", "markdown", "yaml" }, highlight = { enable = true, }, indent = { enable = true, }, }
require("tree-sitter-surrealdb").setup()

require("toggleterm").setup {
    autochdir = true,
    open_mapping = [[<C-t>]],
    direction = "float",
    float_opts = {
        border = "curved",
    }
}

vim.lsp.enable({ "rust_analyzer", "lua_ls", "zls" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", builtin.lsp_references, opts)
        vim.keymap.set("n", "gt", builtin.lsp_type_definitions, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>fa", function() vim.lsp.buf.format({ async = true }) end, opts)

        vim.diagnostic.config({
            virtual_text = { current_line = true },
            underline = true,
            update_in_insert = true,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "if_many",
            },
        })
    end
})

vim.api.nvim_set_hl(0, "yankhl", { bg = "#666666" })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ higroup = "yankhl", timeout = 75 })
    end,
})

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("v", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<M-o>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-i>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", function() builtin.find_files() end)
vim.keymap.set("n", "<leader>lg", function() builtin.live_grep() end)
vim.keymap.set("n", "<leader>sd", function() builtin.diagnostics() end)
