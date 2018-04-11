function paths_exist --description 'true if given paths exist, else false'
	for path in $argv
		if test ! -e $path
			return (false)
		end
	end
	return (true)
end

function maybe_path_append --description 'Appends paths to the PATH variable if paths exists'
	set paths $argv
	if paths_exist $paths
		set -x PATH $PATH $paths
	end
end

function maybe_path_prepend --description 'Prepends paths to the PATH variable if paths exists'
	set paths $argv
	if paths_exist $paths
		set -x PATH $paths $PATH
	end
end

function gnu_install
	switch (uname)
		case Darwin
			echo ginstall $argv
			#ginstall $argv
		case '*'
			echo install $argv
			#install $argv
	end
end

function maybe_install --description ''
	set perm $argv[1]
	set src $argv[2..-2]
	set dst $argv[-1]
	set sources (string join ' ' $src)
	if paths_exist $src
		gnu_install -d $dst
		gnu_install -D -m $perm $src $dst
		echo "[done] installing ($perm) $sources -> $dst"
	else
		echo "[warning] not installing ($perm) $src -> $dst"
		echo "[warning] "$sources" doesn't exist"
	end 
end

