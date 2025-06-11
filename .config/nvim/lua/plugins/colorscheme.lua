return {
  -- add catppuccin
  { "catppuccin/nvim" },
  { "Mofiqul/dracula.nvim" },

  {
    dir = "/home/raydn/dev/neovim/strix.nvim",
    name = "strix",
    lazy = false,
    priority = 1000, -- Load before other plugins
    -- config = function()
    --   vim.cmd("colorscheme strix-night")
    -- end,
  },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin",
      -- colorscheme = "strix-night",
      -- colorscheme = "dracula",
      colorscheme = "tokyonight-night",
    },
  },
}
