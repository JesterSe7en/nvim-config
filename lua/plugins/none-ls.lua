return {
  "nvimtools/none-ls.nvim", -- fork of null-ls since null-ls is depricated, still uses the same commands as null-ls
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
