local bo = vim.bo
local ft = vim.filetype
local g = vim.g
local opt = vim.opt
local o = vim.o
local wo = vim.wo

-- Diagnostic Settings
vim.diagnostic.config({
  underline = true,
  signs = true,
  update_in_insert = false,
  virtual_text = false,
})
local signs = { Error = "󰅚 ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- -----------------


-- Enable Treesitter/LSP For Hyprlang 
ft.add({ pattern = {  [ ".*/hypr/.*%.conf" ] = "hyprlang" } })

opt.tabstop = 4                 -- Default Tabstop
-- setting block cursor for all mode
opt.guicursor = "n-v-c-i:block,i:block-blinkwait175-blinkoff150-blinkon175";

wo.relativenumber = true        -- Enable Relative Line Numbers 
wo.cursorline = true            -- Highlight current line
wo.number = true                -- Make line numbers default
wo.signcolumn = 'yes'           -- Keep signcolumn on by default

o.hlsearch = false              -- Set highlight on search
o.mouse = 'a'                   -- Enable mouse mode
o.clipboard = 'unnamedplus'     -- Sync clipboard between OS and Neovim.
o.breakindent = true            -- Enable break indent
o.undofile = true               -- Save undo history

-- Case-insensitive searching UNLESS \C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time
o.updatetime = 250
o.timeoutlen = 300

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
o.termguicolors = true

-- Disable Netrw in favor of nvimTree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
