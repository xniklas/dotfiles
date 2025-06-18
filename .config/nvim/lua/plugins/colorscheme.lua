return {
    -- add catppuccin
    { "catppuccin/nvim" },
    { "ficcdaf/ashen.nvim" },

    -- Configure LazyVim to load catppuccin
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "catppuccin",
            -- colorscheme = "tokyonight-night",
            colorscheme = "ashen",
        },
    },
}
