fish_vi_key_bindings

{{#is_macos}}
test -e ~/.config/iterm2/shell_integration.fish; and source ~/.config/iterm2/shell_integration.fish
{{/is_macos}}

source ~/.config/fish/functions/utils.fish

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x HISTFILE $XDG_DATA_HOME/history

set -x RANGER_LOAD_DEFAULT_RC FALSE
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x LESS "-cR"
set -x EDITOR nvim
set -x SUDO_EDITOR $EDITOR
set -x PAGER less
set -x MANPAGER less
#set -x MANPAGER "nvim -c 'set ft=man' -"
set -x FILE_EXPLORER ranger
set -x FILE_FINDER fasd
set -x MUSIC_PLAYER ncmpcpp
set -x VIDEO_PLAYER mpv
set -x EMAIL_CLIENT thunderbird

set -x PYTHONPATH $PYTHONPATH /usr/local/anaconda3/lib/python3.6/site-packages

{{#is_desktop}}
set -x CUDA_PATH /opt/cuda-9.0
set -x LD_LIBRARY_PATH $CUDA_PATH/lib64
{{/is_desktop}}

{{#is_desktop}}
maybe_path_prepend ~/.local/bin
maybe_path_prepend ~/.local/opt/kitty/bin
maybe_path_prepend $CUDA_PATH/bin/
maybe_path_append ~/.local/opt/anaconda3/bin
maybe_path_append ~/.local/opt/bazel-0.11.0/bin
{{/is_desktop}}

maybe_path_append ~/.gem/ruby/2.5.0/bin

alias l "ls -hl"
alias r "ranger"
alias g "egrep -i"
alias m $MUSIC_PLAYER
alias v $EDITOR
alias p $PAGER
alias suv "sudoedit"

#source (conda info --root)/etc/fish/conf.d/conda.fish

