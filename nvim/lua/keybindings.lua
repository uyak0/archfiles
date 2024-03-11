return {  
  -- [[ Custom Keymaps ]]
  -- Search and replace 
  vim.keymap.set('n', '<leader>H', ':%s//c<Left><Left>', { desc = 'Search and Replace', silent = true }),

  -- Enter new line without leaving normal mode
  vim.keymap.set('n', '<C-o>', 'o<ESC>', { desc = 'Insert new line below', silent = true }),

  -- [[ Keymaps from kickstart.nvim ]]
  -- Keymaps for better default experience
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }),

  -- Remap for dealing with word wrap
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }),
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }),

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' }),
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' }),
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' }),
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' }),
}
