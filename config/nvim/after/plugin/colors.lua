function ColorMyPencils(color, mode)
	color = color or "gruvbox"

  local current_hour = os.date("*t").hour
  mode = mode or "light"
  if current_hour >= 16 then
    mode = mode or "dark"
  end

  -- TODO select a light colorscheme if it's early,
  -- otherwise a dark colorscheme, but how to pick? randomly?

	vim.cmd.colorscheme(color)
  vim.opt.background = mode

  if mode == "dark" then
    -- transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end

end

-- light: "edge"
-- dark : "aylin", ""

--ColorMyPencils("rose-pine-main", "dark")
--ColorMyPencils("rose-pine-dawn", "dark")
--ColorMyPencils("gruvbox", "light")
--ColorMyPencils("gruvbox", "light")
--ColorMyPencils("kanagawa", "light")
--ColorMyPencils("kanagawa-dragon", "dark")
--ColorMyPencils("gruvbox")
--ColorMyPencils("pink-moon", "dark")
--ColorMyPencils("edge", "dark")

--ColorMyPencils("kanagawa", "light")
--ColorMyPencils("kanagawa", "dark")
--ColorMyPencils("kanagawa-dragon", "dark")

--ColorMyPencils("gruvbox", "dark")
ColorMyPencils("gruvbox-material", "dark")
--ColorMyPencils("cyberdream-light", "dark")

--ColorMyPencils("kanagawa", "light")



--ColorMyPencils("aylin", "dark")









-- sooooothing
--ColorMyPencils("rose-pine-dawn", "light")
--ColorMyPencils("cyberdream-light", "light")
--ColorMyPencils("gruvbox", "light")
--ColorMyPencils("kanagawa", "light")
--ColorMyPencils("kanagawa", "light")

--ColorMyPencils("monokai_pro")
--
