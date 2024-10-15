return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {

				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				scss = { { "prettierd", "prettier" } },
				less = { { "prettierd", "prettier" } },
				vue = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
				graphql = { { "prettierd", "prettier" } },
				go = { "gofmt", "goimports" },
				rust = { "rustfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				java = { "google_java_format" },
				kotlin = { "ktlint" },
				php = { "php_cs_fixer" },
				ruby = { "rubocop" },
				swift = { "swiftformat" },
				shell = { "shfmt" },
				sql = { "sqlfluff" },
				terraform = { "terraform_fmt" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>wf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
