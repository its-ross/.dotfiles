require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Quit Neovim (Quit All)
map("n", "<leader>qq", "<cmd>confirm qa<CR>", { desc = "Quit Neovim" })
-- Toggle NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- Prev/Next buffer shortcuts
map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
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
