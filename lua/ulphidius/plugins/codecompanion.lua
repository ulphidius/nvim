return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local codecompanion = require("codecompanion")
		codecompanion.setup({
			opts = {
				log_level = "DEBUG",
			},
			strategies = {
				chat = {
					-- adapter = "ollama",
					adapter = "mistral",
				},
				inline = {
					-- adapter = "ollama",
					adapter = "mistral",
				},
				cmd = {
					-- adapter = "ollama",
					adapter = "mistral",
				},
			},
			adapters = {
				mistral = function()
					return require("codecompanion.adapters").extend("mistral", {
						env = {
							url = "https://codestral.mistral.ai",
							api_key = os.getenv("MISTRAL_CODESTRAL_API_KEY"),
						},
						schema = {
							model = {
								default = "codestral-latest",
							},
						},
					})
				end,
				-- ollama = function()
				-- 	return require("codecompanion.adapters").extend("ollama", {
				-- 		name = "mistral",
				-- 		schema = {
				-- 			model = {
				-- 				default = "mistral:latest",
				-- 			},
				-- 		},
				-- 		env = {
				-- 			url = "127.0.0.1:11434",
				-- 			-- api_key = "OLLAMA_API_KEY",
				-- 		},
				-- 		headers = {
				-- 			["Content-Type"] = "application/json",
				-- 			-- ["Authorization"] = "Bearer ${api_key}",
				-- 		},
				-- 		parameters = {
				-- 			sync = true,
				-- 		},
				-- 	})
				-- end,
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<CR>", { desc = "Comment current cursor line" })
	end,
}
