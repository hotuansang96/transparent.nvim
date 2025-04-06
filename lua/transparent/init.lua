local M = {}

M.setup = function(opts)
	local prefixes = opts.prefixes or {}
	local excludes = opts.excludes or {}

	-- Function to check if a name starts with any excluded prefix
	local function is_excluded(name)
		for _, exclude_prefix in ipairs(excludes) do
			if name:sub(1, #exclude_prefix) == exclude_prefix then
				return true
			end
		end
		return false
	end

	for _, prefix in ipairs(prefixes) do
		local highlights = vim.fn.getcompletion(prefix, "highlight")
		for _, name in ipairs(highlights) do
			if not is_excluded(name) then
				local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
				if hl.bg then
					hl.bg = "NONE" -- Preserve other attributes
					vim.api.nvim_set_hl(0, name, hl)
				end
			end
		end
	end
end

return M
