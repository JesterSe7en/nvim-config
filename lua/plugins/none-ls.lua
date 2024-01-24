return {
	-- This plugin bridges the gap between neovim and varioous cli tools that do formatting or linting
	-- It wraps it into a lsp-like format for neovim
	"nvimtools/none-ls.nvim", -- fork of null-ls since null-ls is depricated, still uses the same commands as null-ls
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint_d,
        -- dont need one for rust? since rustfmt has been depricated
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
