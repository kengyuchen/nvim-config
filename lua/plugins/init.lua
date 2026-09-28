return {
    -- Theme
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
		lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    },

    -- Statusline (Modern Lightline replacement)
	{
	  "nvim-lualine/lualine.nvim",
	  dependencies = { "catppuccin" }, -- Ensure catppuccin loads first
	  config = function()
		-- 1. Get the colors from the Catppuccin plugin
		local C = require("catppuccin.palettes").get_palette("mocha")
		
		-- 2. Define your custom theme table exactly as you found it
		local catppuccin_theme = {
		  normal = {
			a = { bg = C.blue, fg = C.mantle, gui = "bold" },
			b = { bg = C.surface0, fg = C.blue },
			c = { bg = "none", fg = C.text }, -- "none" for transparency
		  },
		  insert = {
			a = { bg = C.green, fg = C.base, gui = "bold" },
			b = { bg = C.surface0, fg = C.green },
		  },
		  terminal = {
			a = { bg = C.green, fg = C.base, gui = "bold" },
			b = { bg = C.surface0, fg = C.green },
		  },
		  command = {
			a = { bg = C.peach, fg = C.base, gui = "bold" },
			b = { bg = C.surface1, fg = C.peach },
		  },
		  visual = {
			a = { bg = C.mauve, fg = C.base, gui = "bold" },
			b = { bg = C.surface0, fg = C.mauve },
		  },
		  replace = {
			a = { bg = C.red, fg = C.base, gui = "bold" },
			b = { bg = C.surface0, fg = C.red },
		  },
		  inactive = {
			a = { bg = "none", fg = C.blue },
			b = { bg = "none", fg = C.surface1, gui = "bold" },
			c = { bg = "none", fg = C.overlay0 },
		  },
		}

		-- 3. Pass the table to Lualine
		require("lualine").setup({
		  options = {
			theme = catppuccin_theme,
			globalstatus = true,
			icons_enabled = true,
		  },
		})
	  end,
	},

    -- GitHub Copilot
    {
        "github/copilot.vim",
        config = function()
            vim.cmd([[highlight CopilotSuggestion guifg=#90ACC0 ctermfg=10]])
        end
    },
	
	-- Copilot Chat
	{
	  "CopilotC-Nvim/CopilotChat.nvim",
	  branch = "main",
	  dependencies = {
		{ "github/copilot.vim" },
		{ "nvim-lua/plenary.nvim" },
	  },
	  opts = {
		debug = false, -- Set to true to see help if it fails
		show_help = true, -- Show help in the chat window
		window = {
		  layout = 'vertical', -- 'vertical', 'horizontal', 'float'
		  width = 0.4, -- 40% of the screen
		},
	  },
	  keys = {
		-- Custom keybindings to open the chat
		{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
	  },
	},

    -- Telescope (Fuzzy Finder)
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<C-p>", ":Telescope find_files<CR>" }
        },
		opts = {
			defaults = {
				mappings = {
					i = {
						["<CR>"] = "select_default",
						["<C-t>"] = "select_tab",
						["<C-v>"] = "select_vertical",
						["<C-x>"] = "select_horizontal",
					},
					n = {
						["<CR>"] = "select_default",
						["<C-t>"] = "select_tab",
						["<C-v>"] = "select_vertical",
						["<C-x>"] = "select_horizontal",
					},
				},
			},
		},
	},

    -- VimTex
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = 'skim'
            vim.g.vimtex_quickfix_open_on_warning = 0
        end
    },

	-- Bufferline
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		opts = {
			options = {
			  mode = "buffers",      -- Changed from "tabs"
			  numbers = "ordinal", -- Shows the internal ID for jumping
			  diagnostics = "nvim_lsp",
			  separator_style = "slant",
			}
		}
	},

	-- Tabularize
	{ "godlygeek/tabular" },

	-- Textidote (Grammar/Spelling Checker)
	{
		"PatrBal/vim-textidote",
		ft = { "tex", "markdown" },  -- lazy-load only for LaTeX/Markdown
	},
}
