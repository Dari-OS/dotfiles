return {

	{
		name = "bash",
		filetypes = { "bash", "sh" },
		treesitter = { "bash" },
		lsp = "bashls",
		formatter = "beautysh",
		linter = "shellcheck",
	},
	{
		name = "c",
		filetypes = { "c" },
		treesitter = { "c" },
		lsp = "clangd",
		formatter = "clang-format",
		linter = "cpplint",
	},
	{
		name = "cmake",
		filetypes = { "cmake" },
		treesitter = { "cmake" },
		lsp = "cmake",
	},
	{
		name = "cpp",
		filetypes = { "cpp" },
		treesitter = { "cpp" },
		lsp = "clangd",
		formatter = "clang-format",
		linter = "cpplint",
	},
	{
		name = "css",
		filetypes = { "css", "scss" },
		treesitter = { "css" },
		lsp = "cssls",
		formatter = "prettier",
	},
	{
		name = "dockerfile",
		filetypes = { "dockerfile" },
		treesitter = { "dockerfile" },
	},
	{
		name = "gitignore",
		filetypes = { "gitignore" },
		treesitter = { "gitignore" },
	},
	{
		name = "gleam",
		filetypes = { "gleam" },
		treesitter = { "gleam" },
		lsp = "gleam",
		lsp_no_mason = true,
	},
	{
		name = "go",
		filetypes = { "go" },
		treesitter = { "go" },
		lsp = "gopls",
		formatter = "goimports",
		linter = "revive",
	},
	{
		name = "html",
		filetypes = { "html" },
		treesitter = { "html" },
		lsp = "html",
		formatter = "prettier",
	},
	{
		name = "java",
		filetypes = { "java" },
		treesitter = { "java" },
		lsp = "jdtls",
		formatter = "clang-format",
		linter = "checkstyle",
	},
	{
		name = "javascript",
		filetypes = { "js", "jsx" },
		treesitter = { "javascript" },
		lsp = "ts_ls",
		formatter = "prettier",
		linter = "eslint_d",
	},
	{
		name = "typescript",
		filetypes = { "ts", "tsx" },
		treesitter = { "typescript", "tsx" },
		lsp = "ts_ls",
		formatter = "prettier",
		linter = "eslint_d",
	},
	{
		name = "json",
		filetypes = { "json" },
		treesitter = { "json" },
		formatter = "prettier",
	},
	{
		name = "lua",
		filetypes = { "lua" },
		treesitter = { "lua" },
		lsp = "lua_ls",
		lsp_config = {
			settings = {
				Lua = {
					-- Make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
		formatter = "stylua",
	},
	{
		name = "markdown",
		filetypes = { "markdown", "md" },
		treesitter = { "markdown", "markdown_inline" },
		formatter = "prettier",
	},
	{
		name = "python",
		filetypes = { "python" },
		treesitter = { "python" },
		lsp = "ruff",
		formatter = "ruff",
		linter = "ruff",
	},
	{
		name = "query",
		treesitter = { "query" },
	},
	{
		name = "regex",
		treesitter = { "regex" },
	},
	{
		name = "prisma",
		treesitter = { "prisma" },
	},
	{
		name = "omnisharp",
		filetypes = { "cs", "vb", "cshtml", "csproj", "vbproj", "sln" },
		treesitter = { "c_sharp" },
		lsp = "omnisharp",
		lsp_config = {
			cmd = { "omnisharp" },
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = true })
						end,
					})
				end
			end,
		},
	},
	{
		name = "rust",
		filetypes = { "rust" },
		treesitter = { "rust" },
		lsp = "rust_analyzer",
		lsp_config = {
			capabilities = capabilities,
			setting = {
				checkOnSave = {
					command = "clippy",
				},
				completions = {
					completeRustImports = true,
				},
			},
		},
	},
	{
		name = "toml",
		filetypes = { "toml" },
		treesitter = { "toml" },
		lsp = "taplo",
	},
	{
		name = "vim",
		filetypes = { "vim" },
		treesitter = { "vim" },
	},
	{
		name = "vimdoc",
		filetypes = { "vimdoc" },
		treesitter = { "vimdoc" },
	},
	{
		name = "yaml",
		filetypes = { "yaml", "yml" },
		treesitter = { "yaml" },
		lsp = "yamlls",
		formatter = "prettier",
	},
}
