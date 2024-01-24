return {
  'catppuccin/nvim',
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  integrations = {
    lualine = true,
  },
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}

-- We can omit the setup() call by utilizing the config parameter in our lua table
-- https://github.com/folke/lazy.nvim#-plugin-spec  (take a look a the config property description)
-- setup colorscheme  -- pulled from our init.lua
-- require('catppuccin').setup()
-- vim.cmd.colorscheme "catppuccin"
