if true then
  return {}
end
return {
  -- add pylsp to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.configs
      servers = {
        -- pylsp will be automatically installed with mason and loaded with lspconfig
        pylsp = {
          plugins = {
            -- enabled
            ruff = { enabled = true },
            black = { enabled = true },
            pyls_isort = { enabled = true },
            jedi_completion = { fuzzy = true },
            -- disabled
            pylint = { enabled = false, executable = "pylint" },
            pylsp_mypy = { enabled = false },
          },
        },
      },
    },
  },
}
