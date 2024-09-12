return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			local lsp_server = {
				"emmet_ls",
				"lua_ls",
				"pyright",
				"gopls",
			}

			local map = vim.keymap.set

			local lsp_on_attach = function(_, bufnr)
				local function opts(desc)
					return { buffer = bufnr, desc = "LSP " .. desc }
				end

				print("hey , lsp_on_attach")

				map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
				map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
				map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
				map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
				map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
				map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

				map("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts("List workspace folders"))

				map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
				map("n", "gr", vim.lsp.buf.references, opts("Show references"))
			end

			for _, lsp in ipairs(lsp_server) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
					on_attach = lsp_on_attach,
				})
			end

			-- custom configs
			-- lspconfig.gopls.setup({
			-- 	settings = {
			-- 		gopls = {
			-- 			experimentalPostfixCompletions = true,
			-- 			completeUnimported = true,
			-- 			usePlaceholders = true,
			-- 			-- usePlaceholders = false,
			-- 			analyses = {
			-- 				unusedparams = true,
			-- 				shadow = true,
			-- 			},
			-- 			staticcheck = true,
			-- 			gofumpt = true,
			-- 		},
			-- 	},
			-- })

			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						customTags = {
							"!vault",
						},
					},
				},
			})

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							-- checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
		end,
	},
}
