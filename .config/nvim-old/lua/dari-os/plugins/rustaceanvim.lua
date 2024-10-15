return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	ft = { "rust" },
	config = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr)
					-- Ensure diagnostics are enabled
					vim.lsp.handlers["textDocument/publishDiagnostics"] =
						vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
							virtual_text = true,
							signs = true,
							update_in_insert = true,
							underline = true,
						})
					-- Enable inlay hints
					if vim.lsp.inlay_hint then
						vim.lsp.inlay_hint.enable(true, { 0 })
					end
				end,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
						diagnostics = {
							enable = true,
							experimental = {
								enable = true,
							},
						},
					},
				},
			},
		}
	end,
}
