return {
	'NvChad/nvim-colorizer.lua',
	config = function()
		require('colorizer').setup {
			filetypes = { "*" },
			user_default_options ={
				tailwind = true,
				names = true,
				css = true,
				mode = "foreground",
			}
		}
	end,
}
