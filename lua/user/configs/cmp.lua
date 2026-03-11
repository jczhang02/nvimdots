return {
	defaults = {
		sorting = {
			comparators = function(_)
				local compare = require("cmp.config.compare")
				compare.lsp_scores = function(entry1, entry2)
					local diff
					if entry1.completion_item.score and entry2.completion_item.score then
						diff = (entry2.completion_item.score * entry2.score)
							- (entry1.completion_item.score * entry1.score)
					else
						diff = entry2.score - entry1.score
					end
					return (diff < 0)
				end

				return vim.list_extend(require("core.settings").use_copilot and {
					require("copilot_cmp.comparators").prioritize,
					require("copilot_cmp.comparators").score,
				} or {}, {
					compare.exact,
					compare.score,
					compare.lsp_scores,
					compare.recently_used,
					compare.kind,
					require("cmp-under-comparator").under,
					compare.sort_text,
					compare.offset,
					compare.length,
					compare.order,
				})
			end,
		},

		sources = {
			-- { name = "minuet" },
			{ name = "nvim_lsp", max_item_count = 350 },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "spell" },
			{ name = "tmux" },
			{ name = "orgmode" },
			{
				name = "buffer",
				option = {
					get_bufnrs = function()
						return vim.api.nvim_buf_line_count(0) < 15000 and vim.api.nvim_list_bufs() or {}
					end,
				},
			},
			{ name = "latex_symbols" },
		},
	},
}
