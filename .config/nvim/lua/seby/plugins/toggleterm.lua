return {
    'akinsho/toggleterm.nvim',
    lazy = false,
    opts = {
        autochdir = true,
        open_mapping = [[<C-t>]],
        direction = "float",
        float_opts = {
            border = "curved",
        }
    },
    setup = function()
        require("toggleterm").setup {}
    end,
    after = function()
        vim.cmd("ToggleTerm direction=float")
    end
}
