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

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      require("nvim-treesitter.configs").setup({
        -- ensure_installed = "all",
        ignore_install = { "org" },
      })
    end,
  },
  {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.1.0",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.3.5",
      },
    },
    config = function()
      require("org-roam").setup({
        directory = "~/org_roam_files",
        -- extensions = {
        --   dailies = {
        --     templates = {
        --       d = {
        --         description = "default",
        --         template = "%u\nTODOS:\n* TODO %?\n",
        --         target = "%<%Y-%m-%d>.org",
        --       },
        --     },
        --   },
        -- },
      })
    end,
  },
}
