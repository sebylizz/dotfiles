return {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.2.2",
    opts = {
        invert_colors = 'always',
        get_main_file = function()
            return 'main.typ'
        end
    },
}
