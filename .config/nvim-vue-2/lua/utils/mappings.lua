local map = vim.keymap.set

-- Align markdown tables
map('n', '<leader>tt', '<cmd>Tab/|<cr>', { desc = 'Align markdown table' })

-- Obsidian
map('n', '<leader>pi', '<cmd>ObsidianPasteImg<cr>', { desc = 'Paste image from clipboard (Obsidian)' })
map('n', '<leader>po', '<cmd>ObsidianOpen<cr>', { desc = 'Open current note in Obsidian' })
map('n', '<leader>pd', '<cmd>ObsidianDailies<cr>', { desc = 'Open daily notes' })

-- Search and replace
map('n', '<leader>H', ':%s//c<Left><Left>', { desc = 'Search and Replace', silent = true })

-- Insert new line without leaving normal mode
map('n', '<C-o>', 'o<ESC>', { desc = 'Insert new line below', silent = true })

-- [[ Keymaps from kickstart.nvim ]]
-- Keymaps for better default experience
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
local diag = require('vim.diagnostic')
map('n', '[d', diag.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', diag.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', diag.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', diag.setloclist, { desc = 'Open diagnostics list' })

-- Telescope keymaps
local builtin = require('telescope.builtin')
map('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader>ff', builtin.buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
map('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader><leader>', builtin.find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
