return {
    {
        optional = true,
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "madsludvig/telescope-stregsystem",
                dependencies = {
                    "rcarriga/nvim-notify",
                },
            },
        },
        keys = {
            vim.keymap.set("n", "<leader>fk", "<cmd>Telescope stregsystem<CR>", { desc = "[-]StregSystem" }),
        },

        config = function()
            require("telescope").setup({
                extensions = {
                    ["stregsystem"] = {
                        username = "seby",
                    },
                },
            })
            pcall(require("telescope").load_extension, "stregsystem")
        end,
    },
}
