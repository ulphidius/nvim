-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- File search
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Code Theme 
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine-moon')
		end
	})
	-- Syntax Tree Analyser
	use{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	-- Syntax Tree Debugger
	use({'nvim-treesitter/playground'})
	-- Linter and auto-complete 
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional
		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}
-- File Explorer Menu
use {
	'nvim-tree/nvim-tree.lua',
	requires = {
		'nvim-tree/nvim-web-devicons', -- optional
	},
	config = function()
		require("nvim-tree").setup {}
	end
}
-- Debugger
use { 'mfussenegger/nvim-dap' }
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
use { 'leoluz/nvim-dap-go' }
use { "folke/neodev.nvim" }
-- Status Bar
use {
	'nvim-lualine/lualine.nvim',
	requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
end)
