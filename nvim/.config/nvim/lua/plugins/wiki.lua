return {
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/wiki/",
          syntax = "markdown", -- Use markdown for compatibility with other tools
          ext = ".md", -- Use .md extension
        },
      }
      vim.cmd("au BufNewFile ~/wiki/diary/*.md :silent 0r !~/wiki/generate_vimwiki_diary_template.py '%'")
      -- vim.keymap.set("n", "<leader>w<leader>t", "<Cmd>VimWikiToggleListItem<CR>", { noremap = true })
    end,
  },
}
