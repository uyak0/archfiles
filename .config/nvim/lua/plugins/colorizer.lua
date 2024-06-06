return {
	'NvChad/nvim-colorizer.lua',
	config = function()
		require('colorizer').setup {
			filetypes = {
				"*",
				vue = { names = true, },
			},
			user_default_options ={
				tailwind = true,
				names = false,
				css = true,
				mode = "foreground",
			}
		}
	end,
}
