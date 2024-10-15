return {
    "goolord/alpha-nvim",
    dependencies = {
  	  "nvim-tree/nvim-web-devicons",
  	  "nvim-lua/plenary.nvim",
      { 'juansalvatore/git-dashboard-nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    },


    config = function()

    -- Enables/Disables the Git history that you would get in the Dashboard if you scroll down
    local enableGitHistory = false

  	  local dashboard = require("alpha.themes.dashboard")


  	  -- helper function for utf8 chars
  	  local function getCharLen(s, pos)
  		  local byte = string.byte(s, pos)
  		  if not byte then
  			  return nil
  		  end
  		  return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
  	  end

  	  local function applyColors(logo, colors, logoColors)
  		  dashboard.section.header.val = logo

  		  for key, color in pairs(colors) do
  			  local name = "Alpha" .. key
  			  vim.api.nvim_set_hl(0, name, color)
  			  colors[key] = name
  		  end

  		  dashboard.section.header.opts.hl = {}

dashboard.section.buttons.val = {
			dashboard.button("b", "  Browse files", ":e .<CR>"),
			dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("c", "  Config", ":cd ~/.config/nvim | e .<CR>"),
dashboard.button("q", "  Quit", "<Cmd>qa<CR>"),
		}

  		  for i, line in ipairs(logoColors) do
  			  local highlights = {}
  			  local pos = 0

  			  for j = 1, #line do
  				  local opos = pos
  				  pos = pos + getCharLen(logo[i], opos + 1)

  				  local color_name = colors[line:sub(j, j)]
  				  if color_name then
  					  table.insert(highlights, { color_name, opos, pos })
  				  end
  			  end

  			  table.insert(dashboard.section.header.opts.hl, highlights)
  		  end
  		  return dashboard.opts
  	  end

  	  require("alpha").setup(applyColors({
  		  [[  ███       ███  ]],
  		  [[  ████      ████ ]],
  		  [[  ████     █████ ]],
  		  [[ █ ████    █████ ]],
  		  [[ ██ ████   █████ ]],
  		  [[ ███ ████  █████ ]],
  		  [[ ████ ████ ████ ]],
  		  [[ █████  ████████ ]],
  		  [[ █████   ███████ ]],
  		  [[ █████    ██████ ]],
  		  [[ █████     █████ ]],
  		  [[ ████      ████ ]],
  		  [[  ███       ███  ]],
  		  [[                    ]],
  		  [[  N  E  O  V  I  M  ]],
  	  }, {
  		  ["b"] = { fg = "#3399ff", ctermfg = 33 },
  		  ["a"] = { fg = "#53C670", ctermfg = 35 },
  		  ["g"] = { fg = "#39ac56", ctermfg = 29 },
  		  ["h"] = { fg = "#33994d", ctermfg = 23},
  		  ["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29},
  		  ["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
  		  ["k"] = { fg = "#30A572", ctermfg = 36},
  	  }, {
  		  [[  kkkka       gggg  ]],
  		  [[  kkkkaa      ggggg ]],
  		  [[ b kkkaaa     ggggg ]],
  		  [[ bb kkaaaa    ggggg ]],
  		  [[ bbb kaaaaa   ggggg ]],
  		  [[ bbbb aaaaaa  ggggg ]],
  		  [[ bbbbb aaaaaa igggg ]],
  		  [[ bbbbb  aaaaaahiggg ]],
  		  [[ bbbbb   aaaaajhigg ]],
  		  [[ bbbbb    aaaaajhig ]],
  		  [[ bbbbb     aaaaajhi ]],
  		  [[ bbbbb      aaaaajh ]],
  		  [[  bbbb       aaaaa  ]],
  		  [[                    ]],
  		  [[  a  a  a  b  b  b  ]],
  	  }))

--[[
vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
--]]

 local footer = function()
      if vim.fn.isdirectory ".git" == 1 and enableGitHistory then
      local ascii_heatmap = require('git-dashboard-nvim').setup {
          days = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" },
          months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" },
          use_current_branch = true,
          filled_squares = { '', '', '', '', '', '' },
          empty_square = '',
 basepoints = { "master", "main" },
colors = {
    days_and_months_labels = '#8AADF4', -- blue
    empty_square_highlight = '#363A4F', -- surface0
    filled_square_highlights = {
        '#494D64', -- surface1
        '#5B6078', -- surface2
        '#8AADF4', -- blue
        '#7DC4E4', -- sapphire
        '#8BD5CA', -- teal
        '#A6DA95', -- green
    },
    branch_highlight = '#8AADF4', -- blue
    dashboard_title = '#CAD3F5', -- text
},
       }
       

        return ascii_heatmap
      else
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return "⚡ Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
      end
    end


vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          dashboard.section.footer.val = footer()
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
}
