return {
	'nvim-telescope/telescope.nvim',
    lazy = false,
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{"<leader>pf", function() require("telescope.builtin").find_files({ hidden = true }) end, desc = "Find Files" },
		{"<leader>lg", function() require("telescope.builtin").live_grep({ hidden = true }) end, desc = "Live grep" },
		{"<leader>ps", function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end, desc = "Search Files" },
        {'<leader>ff', function() require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }}) end, desc = "Find Files"}
	}
}
