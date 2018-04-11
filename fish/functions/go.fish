function go
	set -l match (awk /^$argv[1]\ / ~/.config/go/dirs)
	if test (count $match) -ne 0
		cd (string split ' ' $match[1] | string replace '~' $HOME)[2]
		ls -A
	else
		echo 'shortcut `'$argv[1]'` not found or ambiguous!'
	end
end

