function reconf
	source ~/.config/fish/config.fish
	xrdb -merge ~/.config/X11/Xresources
	killall dunst; dunst & disown
	pkill -SIGUSR1 sxhkd
	source ~/.config/bspwm/bspwmrc
end

function restart
	killall $argv[1]; eval $argv[1] & disown
end

function ieeef
	echo $argv[1] | dec2bin_float
end


