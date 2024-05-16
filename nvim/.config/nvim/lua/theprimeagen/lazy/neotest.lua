return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neotest/nvim-nio",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-jest",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
					require("neotest-vitest"),
					require("neotest-plenary").setup({
						-- this is my standard location for minimal vim rc
						-- in all my projects
						min_init = "./scripts/tests/minimal.vim",
					}),
				},
			})

			vim.keymap.set("n", "<leader>tc", function()
				neotest.run.run()
			end)

			vim.keymap.set("n", "<leader>tf", function()
				neotest.run.run(vim.fn.expand("%"))
			end)
		end,
	},
}
