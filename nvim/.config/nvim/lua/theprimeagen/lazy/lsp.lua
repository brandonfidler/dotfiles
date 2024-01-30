return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		{
			"mrcjkb/rustaceanvim",
			version = "^4", -- Recommended
			ft = { "rust" },
		},
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		require("fidget").setup()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"html",
				"lua_ls",
				--				"rust_analyzer", --taken out for rustaceanvim
				"tsserver",
				"jsonls",
				"tailwindcss",
			},
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["tsserver"] = function()
					require("lspconfig")["tsserver"].setup({
						capabilities = capabilities,
						on_attach = function(client)
							client.resolved_capabilities.document_formatting = false
							client.resolved_capabilities.document_range_formatting = false
						end,
					})
				end,
				["html"] = function()
					require("lspconfig")["html"].setup({
						capabilities = capabilities,
						filetypes = { "html", "markdown" },
						init_options = {
							configurationSection = { "html", "css", "javascript", "markdown" },
							embeddedLanguages = {
								css = true,
								javascript = true,
								markdown = true,
							},
						},
						root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
					})
				end,

				["tailwindcss"] = function()
					require("lspconfig")["tailwindcss"].setup({
						capabilities = capabilities,
						cmd = { "tailwindcss-language-server", "--stdio" },
						filetypes = {
							"css",
							"scss",
							"sass",
							"postcss",
							"html",
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"svelte",
							"vue",
							"rust",
						},
						init_options = {
							-- There you can set languages to be considered as different ones
							-- by tailwind lsp I guess same as include Languages in VSCode
							userLanguages = {
								rust = "html",
							},
						},
						-- Here If any of files from list will exist tailwind lsp will activate.
						root_dir = require("lspconfig").util.root_pattern(
							"tailwind.config.js",
							"tailwind.config.ts",
							"postcss.config.js",
							"postcss.config.ts",
							"windi.config.ts"
						),
					})
				end,
				["lua_ls"] = function()
					capabilities = capabilities
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		vim.diagnostic.config({
			update_in_insert = true,
			virtual_text = true,
		})
	end,
}
