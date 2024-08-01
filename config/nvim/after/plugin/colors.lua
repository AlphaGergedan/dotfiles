

function ColorMyPencils(color, mode)
	color = color or "gruvbox"
  mode = mode or "dark"

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
ColorMyPencils("rose-pine-dawn", "light")
--ColorMyPencils("gruvbox", "light")

--ColorMyPencils("edge", "dark")

