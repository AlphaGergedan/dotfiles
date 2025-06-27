function ColorMyPencils(color, mode)
	color = color or "gruvbox-material"

  local current_hour = os.date("*t").hour
  if current_hour >= 16 or current_hour <= 5 then
    mode = mode or "dark"
  end

  mode = mode or "light" -- fallback to light

	vim.cmd.colorscheme(color)
  vim.opt.background = mode

  if mode == "dark" then
    -- transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
end

-- dark: 'rose-pine-main', 'aylin', 'kanagawa-dragon', 'gruvbox-material', 'monokai_pro', 'edge', 'pink-moon'
-- light: 'gruvbox-material', 'kanagawa', 'gruvbox', 'cyberdream-light', 'rose-pine-dawn'
ColorMyPencils("gruvbox-material")
