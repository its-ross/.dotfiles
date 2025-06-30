if true then
  return {}
end
return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
      })
      require("blink.cmp").setup({
        sources = {
          per_filetype = {
            org = { "orgmode" },
          },
          providers = {
            orgmode = {
              name = "Orgmode",
              module = "orgmode.org.autocompletion.blink",
              fallbacks = { "buffer" },
            },
          },
        },
      })
      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
}
