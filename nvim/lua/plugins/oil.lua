return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
}
