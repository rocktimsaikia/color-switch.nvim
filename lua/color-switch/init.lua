-- Define the module
local M = {}

--  #FF5733

function escape_pattern(text)
	return text:gsub("([^%w])", "%%%1")
end

function convert_hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	local r = tonumber(hex:sub(1, 2), 16)
	local g = tonumber(hex:sub(3, 4), 16)
	local b = tonumber(hex:sub(5, 6), 16)
	return string.format("rgb(%d, %d, %d)", r, g, b)
end

function convert_rgb_to_hex(rgb_color_str)
	local r, g, b = rgb_color_str:match("rgb%((%d+),%s*(%d+),%s*(%d+)%)")
	r = tonumber(r)
	g = tonumber(g)
	b = tonumber(b)
	return string.format("#%02X%02X%02X", r, g, b)
end

function M.switch_colors()
	local current_line = vim.api.nvim_get_current_line()
	local hex_color = current_line:match("#%x%x%x%x%x%x")
	local rgb_color = current_line:match("rgb%(%s*%d+%s*,%s*%d+%s*,%s*%d+%s*%)")

	if hex_color then
		local rgb_color_code = convert_hex_to_rgb(hex_color)
		local updated_line = current_line:gsub(hex_color, rgb_color_code)
		vim.api.nvim_set_current_line(updated_line)
	elseif rgb_color then
		print("rgb found")
		local hex_color_code = convert_rgb_to_hex(rgb_color)
		local escaped_rgb_color = escape_pattern(rgb_color)
		local updated_line = current_line:gsub(escaped_rgb_color, hex_color_code)
		vim.api.nvim_set_current_line(updated_line)
	else
	end
end

vim.api.nvim_create_user_command("ColorSwitch", function()
	M.switch_colors()
end, { nargs = 0 })

-- Return the module
return M
