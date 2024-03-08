-- leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- plugins
local plugins = {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { 
    "folke/which-key.nvim", 
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
  { "nvim-telescope/telescope.nvim", branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-lualine/lualine.nvim' },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins, opts)

-- colours
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- lualine
require('lualine').setup({
  options = { 
    theme = 'gruvbox',
    icons_enabled = false,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  }
})

-- which-key
local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    -- top level
    ["<space>"] = { "<cmd>noh<cr>", "Clear hlsearch highlights" },

    -- groups
    f = {
      name = "file", 
      f = { "<cmd>Telescope find_files<cr>", "find_file" }, 
      g = { "<cmd>Telescope live_grep<cr>", "live_grep" },
      b = { "<cmd>Telescope buffers<cr>", "buffers" },
      h = { "<cmd>Telescope help_tags<cr>", "help_tags" },
    },
  } 
})

-- remaps
vim.api.nvim_set_keymap('n', '<up>', '',  { noremap = true })
vim.api.nvim_set_keymap('n', '<down>', '', { noremap = true })
vim.api.nvim_set_keymap('n', '<left>', '', { noremap = true })
vim.api.nvim_set_keymap('n', '<right>', '', { noremap = true })
vim.api.nvim_set_keymap('i', '<up>', '',  { noremap = true })
vim.api.nvim_set_keymap('i', '<down>', '', { noremap = true })
vim.api.nvim_set_keymap('i', '<left>', '', { noremap = true })
vim.api.nvim_set_keymap('i', '<right>', '', { noremap = true })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })

-- other vim options
vim.o.wrap = true
vim.o.textwidth = 79
vim.o.formatoptions = qrn1
vim.o.colorcolumn = 85
vim.o.relativenumber = true
vim.o.cursorline = true
