return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		name = "kanagawa",
		priority = 1000,

		config = function()
			require("kanagawa").setup({
				transparent = true,
				theme = "wave",
			})
			vim.cmd.colorscheme("kanagawa")
		end,
	},
}
