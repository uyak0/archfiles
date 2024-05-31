return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre " .. vim.fn.expand "~" .. "/top-secret/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/top-secret/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- Optional
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    disable_frontmatter = true,
    ui = { enable = false, },
    workspaces = {
      {
        name = "personal",
        path = "~/top-secret",
      },
    },
    template = {
      folder = "Assets/Templates",
    },
    attachments = {
      img_folder = "Attachments/image",
    },
    disable_frontmatter = true,
  },
}
