return {
    {
        "EdenEast/nightfox.nvim",
        name = "duskfox",
        dependencies = "xiyaowong/transparent.nvim",
        config = function()
            require('nightfox').setup({
                palettes = {
                    duskfox = {
                        bg1 = "#111111",
                        bg3 = "#222222",
                    }
                }
            });
            vim.cmd.colorscheme("duskfox")
        end
    }
}
