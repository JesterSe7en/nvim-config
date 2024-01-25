return {
  {
    -- this is to allow for completions from the lsp
    -- this is just incase the friendly-snippets plugin does not have an entry for that language, it can
    -- reach out to the lsp for hints
    'hrsh7th/cmp-nvim-lsp',
  },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip", -- actually does the expansion of a snippet
			"rafamadriz/friendly-snippets", -- the actual source of snippets from all programming languages
		},
	},
	{
		"hrsh7th/nvim-cmp", -- this is just the engine to power completions
		config = function()
			-- Set up nvim-cmp.
			local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args) -- this is what will fully expand a code snippet
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- allows for completion from the lsp
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
