return {
	"folke/zen-mode.nvim",
	dependencies = { "folke/twilight.nvim" }, -- Add twilight.nvim
	config = function()
		require("zen-mode").setup({
			window = {
				options = {},
			},
			plugins = {
				wezterm = {
					enabled = true,
					font = "+6",
				},
				twilight = { enabled = true }, -- Enable twilight integration
			},
		})

		vim.keymap.set("n", "<leader>zz", function()
			local minimal = vim.v.count > 0

			require("zen-mode").toggle()
			vim.wo.wrap = false

			if minimal then
				vim.wo.number = false
				vim.wo.rnu = false
				vim.opt.colorcolumn = "0"
			else
				vim.wo.number = true
				vim.wo.rnu = true
			end

			ColorMyPencils()
		end)
	end,
}
