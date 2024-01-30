require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup("ThePrimeagen", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.filetype.add({
	extension = {
		temple = "temple",
	},
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = ThePrimeagenGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd({ "BufWritePre" }, {
	group = ThePrimeagenGroup,
	pattern = "*rs",
	command = ":RustFmt",
})

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
	callback = function()
		-- Save cursor position
		local save_pos = vim.api.nvim_buf_get_mark(0, '"')
		-- Run eslint_d with --fix-to-stdout and replace buffer content
		local eslint_output = vim.fn.system(
			"eslint_d --stdin --fix-to-stdout --stdin-filename " .. vim.fn.expand("%:p"),
			vim.api.nvim_buf_get_lines(0, 0, -1, false)
		)
		-- Only update buffer if eslint_d succeeded
		if vim.v.shell_error == 0 then
			vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(eslint_output, "\n"))
		end
		-- Restore cursor position
		vim.api.nvim_win_set_cursor(0, save_pos)
	end,
})

autocmd("LspAttach", {
	group = ThePrimeagenGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		if not (e.data and e.data.client_id) then
			return
		end

		local bufnr = e.buf
		local client = vim.lsp.get_client_by_id(e.data.client_id)
		require("lsp-inlayhints").on_attach(client, bufnr)
	end,
})

vim.g.netrw_banner = 0
vim.g.netrw_browser_split = 0
vim.g.netrw_winsize = 25

ColorMyPencils("tokyonight")
