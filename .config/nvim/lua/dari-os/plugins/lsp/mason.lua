return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup()

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"dockerls",
				"docker_compose_language_service",
				"dotls",
				"gopls",
				"grammarly",
				"jsonls",
				"jdtls",
				"marksman",
				"nginx_language_server",
				"bashls",
				"rust_analyzer",
				"clangd",
				"cmake",
				"taplo",
				"lemminx",
				"yamlls",
				"prismals",
				"pyright",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- JavaScript, TypeScript, JSON, YAML, Markdown, HTML, CSS, SCSS, Less, Vue, Svelte, GraphQL
				"prettierd", -- Faster version of prettier
				"stylua", -- Lua formatter
				"isort", -- Python formatter (sorts imports)
				"black", -- Python formatter
				"goimports", -- Go formatter (manages imports)
				"clang-format", -- C/C++ formatter
				"google-java-format", -- Java formatter
				"ktlint", -- Kotlin formatter
				"php-cs-fixer", -- PHP formatter
				"shfmt", -- Shell script formatter
				"sqlfluff", -- SQL formatter
				"eslint_d", -- JavaScript/TypeScript linter
				"pylint", -- Python linter
			},
		})
	end,
}
