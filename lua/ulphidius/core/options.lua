vim.cmd("let g:netrw_liststyle = 3")
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

local opt = vim.opt

-- Current line count
opt.relativenumber = true
opt.number = true

-- Indentation
opt.tabstop = 4 -- Number of tab spaces
opt.shiftwidth = 4 -- Number of spaces for width
opt.expandtab = true -- Extand tab to spaces
-- opt.autoindent = true -- Copy the indent level of the previous line
opt.smartindent = true -- Automatic identation system (it contains autoindent normaly)

-- Line show
opt.wrap = true -- Break the line when it's overflow the max line size

-- Search
opt.hlsearch = true -- Highlight of the previous search match
opt.incsearch = true -- Highlight of the current search match
opt.ignorecase = true -- Ignore search case
opt.smartcase = true -- If the search pattern contains a upper case the search become case sensitive
opt.cursorline = true -- Put a line under the cuurent active line

-- Terminal Color
opt.termguicolors = true
opt.background = "dark" -- Defined which background color if favoured if many are handled
opt.signcolumn = "yes" -- Show the sign column to avoid the text to shift

-- Scroll
opt.scrolloff = 10 -- Remain line limit before starting to scroll

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use the system clipboard

-- Split windows
opt.splitright = true -- Vertical split go to the right side of the screen
opt.splitbelow = true -- Horizontal split go to the right side of the screen
