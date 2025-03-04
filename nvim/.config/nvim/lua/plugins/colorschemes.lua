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
  {
    "sainnhe/edge",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.edge_enable_italic = true
      -- vim.cmd.colorscheme("edge")
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
      -- vim.cmd.colorscheme("sonokai")
    end,
  },
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
          ["@constructor.python"] = { fg = colors.entity },
          ["@type.builtin.python"] = { fg = colors.entity },
        },
      })
      vim.g.ayu_italic_comment = true
      vim.g.ayu_italic_parameter = true
      -- vim.cmd.colorscheme("ayu")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "its-ross/melange-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("melange")
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "rockyzhang24/arctic.nvim",
    branch = "v2",
    dependencies = { "rktjmp/lush.nvim" },
  },
}
