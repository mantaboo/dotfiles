-- return {
-- 	"nvimdev/dashboard-nvim",
--   enabled = false,
-- 	event = "VimEnter",
-- 	config = function()
-- 		require("dashboard").setup({
-- 			-- config
--       theme = 'doom'
-- 		})
-- 	end,
-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
-- }
--
return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
                         __        ___.                  
    _____ _____    _____/  |______ \_ |__   ____   ____  
   /     \\__  \  /    \   __\__  \ | __ \ /  _ \ /  _ \ 
  |  Y Y  \/ __ \|   |  \  |  / __ \| \_\ (  <_> |  <_> )
  |__|_|  (____  /___|  /__| (____  /___  /\____/ \____/ 
        \/     \/     \/          \/    \/               

    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
            { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
            { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
            { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
--             {
--               action = [[lua require("lazyvim.util").telescope.config_files()()]],
--               desc = " Config",
--               icon = " ",
--               key = "c"
--             },
            { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
 --           { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },

        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
