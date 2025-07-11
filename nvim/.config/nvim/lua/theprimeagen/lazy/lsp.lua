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
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require("fidget").setup()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"html",
				"lua_ls",
				"mdx_analyzer",
				--				"rust_analyzer", --taken out for rustaceanvim
				"ts_ls",
				"angularls",
				"jsonls",
				"tailwindcss",
				"graphql",
			},
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["angularls"] = function()
					require("lspconfig")["angularls"].setup({
						capabilities = capabilities,
						filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "angular" },
						root_dir = require("lspconfig").util.root_pattern("angular.json", "project.json"),
					})
				end,
				["csharp_ls"] = function()
					require("lspconfig")["csharp_ls"].setup({
						capabilities = capabilities,
						filetypes = { "csharp" },
						root_dir = require("lspconfig").util.root_pattern("*.sln"),
					})
				end,
				["ts_ls"] = function()
					require("lspconfig")["ts_ls"].setup({
						capabilities = capabilities,
						filetypes = {
							"typescript",
							"typescriptreact",
							"typescript.tsx",
							"markdown",
							"markdown.mdx",
							"javascript",
							"javascriptreact",
						},
						root_dir = require("lspconfig").util.root_pattern("tsconfig.json", "jsconfig.json", ".git"),
					})
				end,
				["graphql"] = function()
					require("lspconfig")["graphql"].setup({
						capabilities = capabilities,
						filetypes = { "graphql", "javascript", "typescript", "javascriptreact", "typescriptreact" },
						root_dir = require("lspconfig").util.root_pattern(
							".graphqlrc",
							".graphql.config.json",
							"package.json",
							"tsconfig.json",
							".git"
						),
					})
				end,
				["mdx_analyzer"] = function()
					require("lspconfig")["mdx_analyzer"].setup({
						capabilities = capabilities,
						filetypes = { "markdown", "markdown.mdx" },
						typescript = {
							tsconfig = "tsconfig.json",
							filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
						},
						root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
					})
				end,
				["html"] = function()
					require("lspconfig")["html"].setup({
						capabilities = capabilities,
						filetypes = { "html", "markdown", "css", "javascript", "typescript", "svelte", "vue" },
						init_options = {
							configurationSection = { "html", "css", "javascript", "markdown", "typescript" },
							embeddedLanguages = {
								css = true,
								angular = true,
								javascript = true,
								typescript = true,
								markdown = true,
							},
						},
						root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
					})
				end,
				["cssls"] = function()
					require("lspconfig")["cssls"].setup({
						capabilities = capabilities,
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
						root_dir = require("lspconfig").util.root_pattern(
							"tailwind.config.js",
							"tailwind.config.ts",
							"postcss.config.js",
							"postcss.config.ts",
							"windi.config.ts"
						),
						settings = {
							css = {
								validate = true,
								lint = {
									unknownAtRules = "ignore",
								},
							},
							scss = {
								validate = true,
								lint = {
									unknownAtRules = "ignore",
								},
							},
							less = {
								validate = true,
								lint = {
									unknownAtRules = "ignore",
								},
							},
							postcss = {
								validate = true,
								lint = {
									unknownAtRules = "ignore",
								},
							},
							stylus = {
								validate = true,
								lint = {
									unknownAtRules = "ignore",
								},
							},
						},
					})
				end,

				["tailwindcss"] = function()
					require("lspconfig")["tailwindcss"].setup({
						capabilities = capabilities,
						cmd = {
							"node",
							"/Users/brandonfidler/personal/tailwindcss-intellisense/packages/tailwindcss-language-server/bin/tailwindcss-language-server",
							"--stdio",
						},
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
						lint = {
							invalidApply = "error",
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
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
								workspace = {
									-- Make the server aware of Neovim runtime files
									library = vim.api.nvim_get_runtime_file("", true),
								},
								-- Do not send telemetry data containing a randomized but unique identifier
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
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
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
