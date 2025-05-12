return {
	left = {
		{
			ft = "NvimTree",
			pinned = true,
			collapsed = false,
			size = { height = 0.6, width = 30 },
			open = "NvimTreeOpen",
		},
		{
			ft = "trouble",
			pinned = true,
			collapsed = false,
			size = { height = 0.4, width = 30 },
			open = "Trouble symbols toggle win.position=right",
			filter = trouble_filter("right"),
		},
	},
}
