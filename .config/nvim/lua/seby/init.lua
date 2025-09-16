local vim = vim

vim.g.ai_cmp = false

vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
  { src = "https://github.com/zbirenbaum/copilot.lua" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/dariuscorvus/tree-sitter-surrealdb.nvim" },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/EdenEast/nightfox.nvim" },
  { src = "https://github.com/saghen/blink.cmp" }
})

require("blink.cmp").setup()

require("toggleterm").setup {
    autochdir = true,
    open_mapping = [[<C-t>]],
    direction = "float",
    float_opts = {
        border = "curved",
    }
}

require('nightfox').setup{
    palettes = {
        duskfox = {
            bg1 = "#111111",
            bg3 = "#222222",
        }
    }
}

vim.cmd.colorscheme("duskfox")

require('nvim-treesitter.configs').setup {
  sync_install = false,
  auto_install = true,
  ensure_installed = { "lua", "svelte", "typescript", "rust", "html", "css", "javascript", "json", "markdown", "yaml" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
vim.lsp.enable({"rust_analyzer"})

require("seby.remap")
require("seby.set")
