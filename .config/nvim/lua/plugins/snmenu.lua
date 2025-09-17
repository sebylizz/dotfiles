return {
    "sebylizz/issmenu",
    event = "VimEnter",
    dependencies = {"rcarriga/nvim-notify", "nvim-lua/plenary.nvim"},
    config = function()
        local apiurl = "https://sparnord.iss.dk/api/v1/iss-menu-plan/menus/"
        require("issmenu").setup(apiurl)
    end,
    keys = {
        vim.keymap.set("n", "<leader>md", "<cmd>ISSMenu<CR>", {noremap = true, silent = true})
    }
}
