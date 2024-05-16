local client = vim.lsp.start_client({
	name = "educational_lsp",
	cmd = { "/Volumes/ExtremePro/work/education/lspTutorial/educationlsp_new/main" },
})

if not client then
	vim.notify("Failed to start educational_lsp")
	return
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.lsp.buf_attach_client(0, client)
	end,
})
