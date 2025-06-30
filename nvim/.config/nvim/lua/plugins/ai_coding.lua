return {
  {
    "David-Kunz/gen.nvim",
    opts = {
      -- model = "deepseek-r1",
      model = "qwen2.5-coder",
      display_mode = "split",
    },
  },
  {
    "Davidyz/VectorCode",
    version = "0.6.12",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "VectorCode",
  },
  {
    "olimorris/codecompanion.nvim",
    commit = "6384dc0", -- the last commit before Nvim 0.10 support was removed
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              schema = {
                model = {
                  default = "qwen2.5-coder",
                },
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "ollama",
            -- model = "qwen2.5-coder",
          },
          inline = {
            adapter = "ollama",
            -- model = "qwen2.5-coder",
          },
          cmd = {
            adapter = "ollama",
            -- model = "qwen2.5-coder",
          },
        },
        extensions = {
          vectorcode = {
            opts = {
              add_tool = true,
              add_slash_command = true,
              ---@type VectorCode.CodeCompanion.ToolOpts
              tool_opts = {
                max_num = { chunk = -1, document = -1 },
                default_num = { chunk = 50, document = 10 },
                include_stderr = false,
                use_lsp = false,
                auto_submit = { ls = false, query = false },
                ls_on_start = false,
                no_duplicate = true,
                chunk_mode = false,
              },
            },
          },
        },
      })
    end,
  },
}
