return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.6',
	lazy = false,
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{"<leader>pf", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
		{"<leader>ps", function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end, desc = "Search Files" }
	}
}
