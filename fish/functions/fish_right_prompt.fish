function fish_right_prompt
	echo (prompt_pwd)" < "(set_color $fish_color_command)(whoami)(set_color normal)"@"(hostname)
end
