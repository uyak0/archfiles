return {

  { -- Surround
    "kylechui/nvim-surround", version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  'godlygeek/tabular',

  -- Auto pair
  -- {
  --   'windwp/nvim-autopairs',
  --   event = "InsertEnter",
  --   config = true
  --   -- use opts = {} for passing setup options
  --   -- this is equalent to setup({}) function
  -- },

  -- Discord RPC
  'andweeb/presence.nvim',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  { 'numToStr/Comment.nvim', opts = {} },
}
