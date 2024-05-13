return {
	"terrortylor/nvim-comment",
	config = function()
		require("nvim_comment").setup({
			-- Linters prefer comment and line to have a space in between markers
			marker_padding = true,
			-- should comment out empty or whitespace only lines
			comment_empty = true,
			-- trim empty comment whitespace
			comment_empty_trim_whitespace = true,
			-- Should key mappings be created
			create_mappings = true,
			-- Normal mode mapping left hand side
			line_mapping = "gcc",
			-- Visual/Operator mapping left hand side
			operator_mapping = "gc",
			-- text object mapping, comment chunk,,
			comment_chunk_text_object = "ic",
			-- Hook function to call before commenting takes place
			hook = nil,
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>/", "<cmd>CommentToggle<CR>", { desc = "Comment current cursor line" })
		keymap.set("v", "<leader>/", "<Esc><cmd>'<,'>CommentToggle<CR>", { desc = "Comment selected code block" })
	end,
}
