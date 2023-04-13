local dap, dapui, daputils = require("dap"), require("dapui"), require('dap.utils')
local mason_config = require("mason-lspconfig")

-- DAP UI
dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
  dapui.close()
end

-- New Gliph
vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

-- Keymaping
vim.keymap.set('n', '<leader>ds', dap.continue)
vim.keymap.set('n', '<leader>dn', dap.step_over)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>do', dap.step_out)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)

-- DAP UI config
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        "scopes",
      },
      size = 0.3,
      position = "right"
    },
    {
      elements = {
        "repl",
        "breakpoints"
      },
      size = 0.3,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
})

-- Mason Default Dependencies
-- Need to manually install Debugger (delve, codelldb) 
mason_config.setup {
	ensure_installed = {
		"lua_ls",
		"golangci_lint_ls",
		"gopls",
		"rust_analyzer",
	},
	automatic_installation = true,
}

-- DAP Adapter
-- dap.adapters.go = {
-- 	type = 'server',
-- 	port = 38697,
-- 	executable = {
-- 		command = vim.fn.stdpath("data") .. '/mason/bin/dlv',
-- 		args = {
-- 			"dap",
-- 			"-l",
-- 			"127.0.0.1:${port}"
-- 		}
-- 	}
-- }

-- DAP Config
-- dap.configurations = {
-- 	go = {
-- 		{
-- 			type = "go", -- Which adapter to use
-- 			name = "Default Debug", -- Human readable name
-- 			request = "launch", -- Whether to "launch" or "attach" to program
-- 			program = "${file}", -- The buffer you are focused on when running nvim-dap
-- 		},
-- 		{
-- 			type = "go",
-- 			name = "Default Debug test (go.mod)",
-- 			request = "launch",
-- 			mode = "test",
-- 			program = "./${relativeFileDirname}",
-- 		},
-- 		{
-- 			type = "go",
-- 			name = "Default Debug Attach (Pick Process)",
-- 			mode = "local",
-- 			request = "attach",
-- 			processId = daputils.pick_process,
-- 		},
-- 		{
-- 			type = "go",
-- 			name = "Default Debug Attach (127.0.0.1:9080)",
-- 			mode = "remote",
-- 			request = "attach",
-- 			port = "9080"
-- 		},
-- 	},
-- }

-- Custom Go delve config
require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}"
  },
}

-- Custom codelldb config
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

