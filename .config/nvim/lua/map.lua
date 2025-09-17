vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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

vim.keymap.set("n", "<leader>1", ":tabfirst<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
        vim.keymap.set('n', 'gr', Snacks.picker.lsp_references)
        vim.keymap.set('n', 'gt', Snacks.picker.lsp_type_definitions)
        vim.keymap.set('n', '<leader>ss', Snacks.picker.lsp_symbols)
        vim.keymap.set('n', '<leader>sS', Snacks.picker.lsp_workspace_symbols)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename)
        vim.keymap.set('n', '<leader>fa', vim.lsp.buf.format({ async = true }))
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

vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end)
vim.keymap.set('n', '<leader>lg', function() Snacks.picker.grep() end)
