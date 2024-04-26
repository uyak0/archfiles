return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>nt",":NvimTreeToggle<cr>" }
	},
	config = function()
		require("nvim-tree").setup {
			view = {
				side = 'right',
				width = 50,
			}
		}
	end,
}
