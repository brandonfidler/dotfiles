return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("lint").linters_by_ft = {
			lua = { "luacheck" },
			rust = { "trivy" },
			html = { "tidy" },
			css = { "stylelint" },
			scss = { "stylelint" },
			markdown = { "markdownlint" },
			angular = { "djlint" },
		}
	end,
}
