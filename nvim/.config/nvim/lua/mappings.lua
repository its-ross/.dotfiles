require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Quit Neovim (Quit All)
map("n", "<leader>qq", "<cmd>confirm qa<CR>", { desc = "Quit Neovim" })
-- Toggle NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- Disable NvChad buffer navigation shortcuts
local nomap = vim.keymap.del

nomap("n", "<tab>")
nomap("n", "<S-tab>")
nomap("n", "<leader>b")
-- Prev/Next buffer shortcuts
map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
-- Close all other listed buffers
map("n", "<leader>bo", function()
local current = vim.api.nvim_get_current_buf()

for _, buf in ipairs(vim.api.nvim_list_bufs()) do
if buf ~= current and vim.api.nvim_buf_is_valid(buf)
and vim.bo[buf].buflisted then
pcall(vim.api.nvim_buf_delete, buf, { force = false })
end
end
end, {
desc = "Delete Other Buffers",
})
-- Git history of the current file (opens a visual diff split of past commits)
map("n", "<leader>gf", function()
  require("gitsigns").setqflist("all") -- Loads all commits for this file into the Quickfix list
end, { desc = "Git: View file history" })

-- Git blame for the current line (opens a floating popup window)
map("n", "<leader>gb", function()
  require("gitsigns").blame_line({ full = true }) -- Full = true shows commit message and time
end, { desc = "Git: Blame current line" })
-- Find files
map("n", "<leader><space>", function()
  local is_git = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):match("true")
  if is_git then
    require("telescope.builtin").git_files()
  else
    require("telescope.builtin").find_files()
  end
end, { desc = "Telescope: Find files (Smart Git/Project)" })
-- Find text/strings
map("n", "<leader>/", function()
  require("telescope.builtin").live_grep()
end, { desc = "Telescope: Live grep text" })
