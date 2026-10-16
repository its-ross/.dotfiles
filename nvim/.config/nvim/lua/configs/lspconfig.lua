require("nvchad.configs.lspconfig").defaults()

local servers = { "lua_ls", "html", "cssls", "pyrefly", "clangd", "markdown", "markdown_inline" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
