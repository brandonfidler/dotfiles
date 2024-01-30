return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "html" },
			sync_install = false,
			auto_install = true,
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
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
