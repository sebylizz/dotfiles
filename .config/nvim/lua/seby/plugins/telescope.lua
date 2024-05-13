return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    keys = {
        { "<leader>lg", function() require("telescope.builtin").live_grep({ hidden = true }) end, desc = "Live grep" },
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files({
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "-g", "!.*/"
                    }
                })
            end,
            desc = "Find Files"
        }
    }
}
