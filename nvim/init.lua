-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
--  Not included in options file because I want it to be clear
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('setup.lazy-nvim')                -- Install Lazy.nvim
require('plugins-list')                   -- Plugins
require('options')                        -- Import all vim options
require('mappings')                       -- keymappings 

vim.cmd[[colorscheme kanagawa-dragon]]    -- Load theme

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

require('setup.nvim-treesitter')     -- Configure Treesitter
require('Comment.ft')
  .set('hyprlang', '#%s')            -- Add commentstring to hyprlang

require('neodev').setup()            -- Setup neovim lua configuration
                                     -- Must happen before lspconfig setup (I think? Wouldn't work otherwise)
require('setup.lsp')                 -- Setup LSP
require('setup.which-key')           -- document existing key chains

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
