local M = {}

M.setup = function(opts)
	local prefixes = opts.prefixes or {}
	local excludes = opts.excludes or {}

	-- Convert the excludes list into a set for fast lookup
	local exclude_set = {}
	for _, name in ipairs(excludes) do
		exclude_set[name] = true
	end

	for _, prefix in ipairs(prefixes) do
		local highlights = vim.fn.getcompletion(prefix, "highlight")
		for _, name in ipairs(highlights) do
			if not exclude_set[name] then
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
