return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
    local languages = require("config.lsp-config") 
    -- local lsp_loader = require("plugins.lsp.lsp-loader").loader
		local formatters_by_ft = {}

    -- TODO: Add a funciton to the lsp-loader to avoid using this methode of reading all formatters
		for _, lang in ipairs(languages) do
			if lang.formatter then
				for _, ft in ipairs(lang.filetypes) do
					formatters_by_ft[ft] = { lang.formatter }
				end
			end
		end

		conform.setup({
			formatters_by_ft = formatters_by_ft,

			format_after_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
