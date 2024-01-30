return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("lint").linters_by_ft = {
			lua = { "luacheck" },
			rust = { "trivy" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			html = { "tidy" },
			css = { "stylelint" },
			scss = { "stylelint" },
			markdown = { "markdownlint" },
		}
	end,
}
