local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lualine/lualine.nvim")

	-- Auto format
	use("windwp/nvim-autopairs") -- auto close bracket
	use("windwp/nvim-ts-autotag") -- auto complete tag
	use("p00f/nvim-ts-rainbow")
	use("lukas-reineke/indent-blankline.nvim")
	use("numToStr/Comment.nvim")

	-- Folding
	--use "kevinhwang91/promise-async"
	--use 'kevinhwang91/nvim-ufo'

	-- Color scheme
	--use("Mofiqul/dracula.nvim")
	use("norcalli/nvim-colorizer.lua")
	--use("dracula/vim")
	--use("Mofiqul/dracula.nvim")
	use("folke/tokyonight.nvim")

	-- Bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
	})

	-- Telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("lalitmee/browse.nvim")

	-- NVIM Tree
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-tree/nvim-web-devicons")
	use("nvim-tree/nvim-tree.lua")

	-- cmp plugin
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use({ "williamboman/mason.nvim", run = ":MasonUpdate" })
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- enable LSP
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("onsails/lspkind.nvim")
	use("SmiteshP/nvim-navic")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
