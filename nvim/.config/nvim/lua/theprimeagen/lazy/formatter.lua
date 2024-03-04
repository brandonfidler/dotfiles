return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				rust = {
					require("formatter.filetypes.rust").ast_grep,
				},
				-- html = {
				-- 	require("formatter.filetypes.html").htmlbeautifier,
				-- 	require("formatter.filetypes.markdown").prettier,
				-- },
				json = {
					require("formatter.filetypes.json").prettier,
				},
				markdown = {
					require("formatter.filetypes.markdown").prettier,
				},
				css = {
					require("formatter.filetypes.css").prettier,
				},
				yaml = {
					require("formatter.filetypes.yaml").prettier,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettier,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
				},
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
