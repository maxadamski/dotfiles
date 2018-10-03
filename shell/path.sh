path() {
	local add_maybe=false
	local add_mode=append
	local action=list
	local paths=()

	while (( $# > 0 )); do
		case $1 in
		-l|--list)
			action=list
			shift;;
		-a|--append)
			add_mode=append
			action=add
			shift;;
		-p|--prepend)
			add_mode=prepend
			action=add
			shift;;
		-o|--optional)
			add_maybe=true
			shift;;
		-h|--help)
			action=help
			shift;;
		*)
			paths+=("$1")
			shift;;
		esac
	done

	
	case $action in
	list)
		echo "$PATH" | tr ':' '\n';;
	add)
		for path in "${paths[@]}"; do
			if [[ ! -e $path ]]; then
				[[ $add_maybe == false ]] && echo "[WARNING] path: '$path' doesn't exist!"
				continue
			fi

			case $add_mode in
			append)
				export PATH=$PATH:$path;;
			prepend)
				export PATH=$path:$PATH;;
			*)
				echo "[ERROR] path: unknown add mode '$add_mode'!"
				return 1;;
			esac
		done;;
	*)
		echo "path [-l|--list] [[-o|--optional] (-p|--prepend)|(-a|--append) PATH...]"
		return 1;;
	esac

	return 0
}
