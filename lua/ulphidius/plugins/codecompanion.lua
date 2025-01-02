return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local codecompanion = require("codecompanion")
		codecompanion.setup({
			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
				},
			},
			adapters = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						env = {
							url = "127.0.0.1:11434",
							-- api_key = "OLLAMA_API_KEY",
						},
						headers = {
							["Content-Type"] = "application/json",
							-- ["Authorization"] = "Bearer ${api_key}",
						},
						parameters = {
							sync = true,
						},
					})
				end,
			},
		})
		
		local keymap = vim.keymap

		keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<CR>", { desc = "Comment current cursor line" })
	end,
}
