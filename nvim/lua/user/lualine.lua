local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("not find lualine, " .. lualine)
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local filename = {
	"filename",
	padding = 0,
}

lualine.setup({
	options = {
		icons_enabled = true,
		-- theme = "onedark",
		theme = "github_dark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { filename },
		lualine_x = { "encoding", filetype },
		lualine_y = {  },
		lualine_z = {  },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
