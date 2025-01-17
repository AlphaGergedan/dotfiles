function ColorMyPencils(color, mode)
	color = color or "gruvbox"
  --mode = mode or "dark"

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

--ColorMyPencils("rose-pine-main")
--ColorMyPencils("rose-pine-dawn", "dark")
--ColorMyPencils("gruvbox", "dark")
--ColorMyPencils("gruvbox")
--ColorMyPencils("kanagawa", "dark")
--ColorMyPencils("kanagawa-dragon")
--ColorMyPencils("gruvbox", "light")
--ColorMyPencils("pink-moon", "light")
ColorMyPencils("pink-moon", "dark")
--ColorMyPencils("edge")
--ColorMyPencils("aylin")

--ColorMyPencils("kanagawa", "light")
--ColorMyPencils("kanagawa", "dark")

--ColorMyPencils("rose-pine-dawn", "light")


--ColorMyPencils("gruvbox", "light")
