-- Check if lazy package manager is available, if not, clone it
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

-- We can simply call setup("plugins") due to how lazy works
-- https://github.com/folke/lazy.nvim#-structuring-your-plugins
require("options")
require("keymaps")
require("lazy").setup("plugins")
