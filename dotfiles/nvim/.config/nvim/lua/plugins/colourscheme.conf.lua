return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = {
    style = "moon",
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = "transparent", -- style for sidebars, see below
      floats = "transparent", -- style for floating windows
    },
  },
}
