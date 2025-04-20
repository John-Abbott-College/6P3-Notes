return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				["python"] = { "ruff" },
				["markdown"] = { "mdformat" },
				["quarto"] = { "mdformat" },
				["*"] = { "codespell" },
			},
			formatters = {
        mdformat = {},
				injected = {
					options = {
						ignore_errors = false,
						lang_to_ext = { quarto = "qmd" },
					},
				},
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		},
	},
}
