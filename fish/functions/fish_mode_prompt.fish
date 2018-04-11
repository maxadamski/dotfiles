function fish_mode_prompt
	# Do nothing if not in vi mode
	if test "$fish_key_bindings" = "fish_vi_key_bindings"
		set_color $fish_color_command
		switch $fish_bind_mode
		case default
		    #set_color normal
		    #echo 🅽  
		    echo N
		case insert
		    #set_color $fish_color_command
		    #echo 🅸  
		    echo I
		case replace-one
		    #set_color green
		    #echo 🅸  
		    echo R
		case visual
		    #set_color $fish_color_param
		    #echo 🆅  
		    echo V
		end
		set_color normal
		printf " "
	end
end
