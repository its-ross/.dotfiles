return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      -- vim.cmd.colorscheme("everforest")
    end,
  },
  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     vim.g.everforest_enable_italic = true
  --     vim.cmd.colorscheme("everforest")
  --   end,
  -- },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- { "EdenEast/nightfox.nvim" },
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      local colors = require("ayu.colors")
      colors.generate(true)
      require("ayu").setup({
        mirage = true,
        terminal = true,
        overrides = {
          ["@variable.builtin"] = { fg = colors.constant },
          ["@variable.parameter"] = { fg = colors.fg, italic = true },
        },
      })
      vim.g.ayu_italic_comment = true
      vim.g.ayu_italic_parameter = true
      vim.cmd.colorscheme("ayu")
    end,
  },
}
