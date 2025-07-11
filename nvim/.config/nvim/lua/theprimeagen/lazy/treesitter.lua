return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	tag = "v0.9.3",
	dependencies = {
		"andymass/vim-matchup", -- Added vim-matchup dependency
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "html", "jsdoc", "bash" },
			sync_install = false,
			auto_install = true,
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			matchup = {
				enable = true,
			},
		})

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.templ = {
			install_info = {
				url = "https://github.com/vrischmann/tree-sitter-temple.git",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "master",
			},
		}
		vim.treesitter.language.register("templ", "templ")
	end,
}
