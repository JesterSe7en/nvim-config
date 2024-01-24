return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- setup treesitter
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "rust", "javascript" },
			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
