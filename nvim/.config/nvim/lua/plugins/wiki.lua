return {
  {
    "lervag/wiki.vim",
    -- tag = "v0.10", -- uncomment to pin to a specific release
    init = function()
      -- wiki.vim configuration goes here, e.g.
      vim.g.wiki_root = "~/wiki"
    end,
  },
  -- {
  --   "vimwiki/vimwiki",
  --   init = function()
  --     vim.g.vimwiki_list = {
  --       {
  --         path = "~/wiki/",
  --         -- syntax = "markdown", -- Use markdown for compatibility with other tools
  --         -- ext = ".md", -- Use .md extension
  --       },
  --     }
  --   end,
  -- },
}
