return {
	"aserowy/tmux.nvim",
	config = function()
		local tmux = require("tmux")
		return tmux.setup({
			copy_sync = {},
		})
	end,
}
