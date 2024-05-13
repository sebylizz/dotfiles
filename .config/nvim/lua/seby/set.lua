vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.cmd("language en_US.UTF-8")

vim.opt.mouse = "a"

vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_set_hl(0, "yankhl", { bg = "#666666" })

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
       vim.hl.on_yank({higroup="yankhl", timeout=50})
    end,
})
