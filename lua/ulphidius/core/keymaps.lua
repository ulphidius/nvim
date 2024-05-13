-- Custom command init key
vim.g.mapleader = " "

local keymap = vim.keymap

-- Center Search
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Search
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "deactivate the search highlight" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close the current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to the next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to the previous tab" })
keymap.set("n", "<leader>tf", "<leader>tabnew %<CR>", { desc = "Open current buffer in a new tab" })

