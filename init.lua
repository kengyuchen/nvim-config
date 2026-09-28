-- 1. SETTINGS (General Configuration)
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false -- Keep tabs as tabs based on your config
opt.autoindent = true
opt.mouse = "a"
opt.wrap = true
opt.scrolloff = 3
opt.hlsearch = true
opt.showmatch = true
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true
opt.background = "dark"
vim.opt.undodir = vim.fn.expand("~/.nvimtmp/")
vim.opt.undofile = true
opt.backup = true
opt.backupdir = vim.fn.expand("~/.nvimtmp/")
opt.directory = vim.fn.expand("~/.nvimtmp/")
opt.whichwrap:append("<,>,[,]")
opt.wildmenu = true            -- Enable the visual command-line completion menu
opt.wildmode = "longest:full,full" -- Complete to longest common string, then open menu
opt.wildoptions = "pum" -- Use the popup menu UI

-- 2. KEYMAPS (Your custom shortcuts)
local keymap = vim.keymap.set

 -- Clear search highlights with Enter
keymap("n", "<CR>", ":nohlsearch<CR><CR>", { silent = true })

-- Save with Ctrl-s
keymap({ "n", "v" }, "<C-s>", ":w<CR>")
keymap("i", "<C-s>", "<Esc>:w<CR>a")

-- Clipboard
keymap("v", "<C-y>", '"+y')
keymap("n", "<leader>p", '"+p')
keymap("v", "<leader>p", '"+p')

-- Insert lines without leaving normal mode
keymap("n", "<leader>j", ":call append(line('.'), '')<CR>j")
keymap("n", "<leader>k", ":call append(line('.') - 1, '')<CR>k")

-- This makes <leader>w act exactly like Ctrl+w
keymap("n", "<leader>w", "<C-w>")


-- When the command-line menu is open:
-- Right expands directories, Left/Up/Down navigates the list.
-- When the menu is closed: Arrow keys move the cursor normally.
keymap('c', '<Right>', function()
	if vim.fn.pumvisible() == 1 then
		return '<Space><BS><Right>'
	end
	return '<Right>'
end, { expr = true, replace_keycodes = true })

keymap('c', '<Left>', function()
	if vim.fn.pumvisible() == 1 then
		return '<Up>'
	end
	return '<Left>'
end, { expr = true, replace_keycodes = true })

keymap('c', '<Down>', function()
	return vim.fn.pumvisible() == 1 and '<C-n>' or '<Down>'
end, { expr = true })

keymap('c', '<Up>', function()
	return vim.fn.pumvisible() == 1 and '<C-p>' or '<Up>'
end, { expr = true })

-- Tab management 
for i = 1, 9 do
    keymap("n", "g" .. i, i .. "gt")
end
keymap("n", "g0", "10gt")
keymap("n", "gc", ":tabnew<CR>")
keymap("n", "gn", ":tabn<CR>")
keymap("n", "gp", ":tabp<CR>")


-- Jump to specific buffer index shown in Bufferline
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function() 
    require("bufferline").go_to(i, true) 
  end)
end
-- Navigate buffers in visual order
vim.keymap.set("n", "<leader>]", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>[", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
-- Close the current buffer and move to the previous one
vim.keymap.set("n", "<leader>x", ":bp | bd #<CR>", { desc = "Close buffer" })

-- Window shortcuts
keymap("n", "<leader>w", "<C-w>")

-- Textidote Configuration
vim.g.textidote_jar = vim.fn.expand("~/bin/textidote.jar")
vim.g.textidote_lang = "en"
vim.g.textidote_dictionary = vim.fn.expand("~/.config/nvim/custom_dict.txt")
-- vim.g.textidote_dict = vim.fn.expand('~/.config/nvim/custom_dict.txt')
vim.keymap.set("n", "<leader>tt", "<cmd>TeXtidoteToggle<CR>", {
  desc = "Toggle TeXtidote",
})


-- Tabularize 
vim.api.nvim_create_user_command('TabAlignBib', function()
	vim.cmd('%Tabularize /=/')
	vim.cmd([[g!/^@\|^}/normal >>]])
end, {})
vim.keymap.set('n', '<leader>ta', ':TabAlign<CR>', { silent = true })


-- 3. BOOTSTRAP LAZY.NVIM
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
