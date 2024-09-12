local opt = vim.opt
-- opt.signcolumn = "yes"
if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
	opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
	opt.foldmethod = "expr"
	opt.foldtext = ""
else
	opt.foldmethod = "indent"
	opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- select and move
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- diagnostics
keymap.set("n", "<C-d>", function()
	vim.diagnostic.goto_next()
end, opts)

-- Navigate vim panes better
keymap.set("n", "<c-k>", "<C-w>k", opts)
keymap.set("n", "<c-j>", "<C-w>j", opts)
keymap.set("n", "<c-h>", "<C-w>h", opts)
keymap.set("n", "<c-l>", "<C-w>l", opts)

-- nvim-neo-tree
keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal float<CR>", opts)
