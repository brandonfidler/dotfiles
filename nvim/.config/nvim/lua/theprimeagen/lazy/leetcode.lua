return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	branch = "master",
	opts = {
		lang = "typescript", -- Changed to typescript
		default_code_filetype = "typescript", -- Changed to typescript
		injector = {
			["ts"] = {
				before = { "# Intuition", "# Approach", "# Complexity Analysis" },
				after = { "# Intuition", "# Approach", "# Complexity Analysis" },
			},
		},
		test_comment_string = {
			typescript = "//",
			-- Add comment strings for other languages if necessary
		},
		image_support = false,

		-- ... other LeetCode plugin configuration options
	},
}
