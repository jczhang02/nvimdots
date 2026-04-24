return {
	["c2e"] = {
		strategy = "inline",
		description = "Translate Chinese to English academically",
		opts = {
			index = 11,
			is_slash_cmd = true,
			auto_submit = false,
			short_name = "c2e",
		},
		prompts = {
			{
				role = "user",
				content = [[
背景：你是世界上最专业的翻译工具，精通中文和英文的学术翻译。
规则：翻译风格简洁，与科研论文相似。保留原始段落格式及术语（FLAC, JPEG等）。保留引用如 [20], \cite{peper}。
策略：分两次翻译，只输出最终结果：
1. DT: 根据文本内容直译，保持原有格式。
2. FT: 根据直译结果重新意译，保留原意且符合英语表达习惯。
]],
			},
		},
	},
	["polish"] = {
		strategy = "inline",
		description = "English academic polish",
		opts = {
			index = 12,
			is_slash_cmd = true,
			auto_submit = false,
			short_name = "polish",
		},
		prompts = {
			{
				role = "user",
				content = [[
Act as an academic spelling and grammar corrector. Revise the following sentences for clarity, conciseness, and coherence. Only provide corrections without explanations. Use formal language, Latin-origin words, proper quantifiers. Avoid contractions and colloquialisms. Keep Markdown/LaTeX format. Print only the final version.
]],
			},
		},
	},
}
