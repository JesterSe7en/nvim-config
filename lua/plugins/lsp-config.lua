return {
	{
		-- main manager for lsp
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- helper plugin that bridges the mason.nvim and lspconfig plugins
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "marksman" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- this is for the completion engine
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.marksman.setup({ capabilities = capabilities })

			-- functionality such as vim.lsp.buf.hover can be found in the help documentation
			-- :h vim.lsp.buf
			-- These are global, we probably want to move this to an autocommand
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
