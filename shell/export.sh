export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export HISTFILE=$XDG_DATA_HOME/history

export RANGER_LOAD_DEFAULT_RC=FALSE
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export LESS="-cR"
export EDITOR=nvim
export SUDO_EDITOR=$EDITOR
export PAGER=less
export MANPAGER=less
export MANPAGER="nvim -c 'set ft=man' -"
export FILE_EXPLORER=ranger
export MUSIC_PLAYER=ncmpcpp
export VIDEO_PLAYER=mpv
export EMAIL_CLIENT=thunderbird

export PYTHONPATH=$PYTHONPATH:/usr/local/anaconda3/lib/python3.6/site-packages
export CUDA_PATH=/opt/cuda-9.0
export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH

path -p ~/.local/bin
path -o -a ~/.local/opt/anaconda3/bin
path -o -a ~/.local/opt/mathematica/bin
path -o -a ~/.local/opt/scala/bin
path -o -a ~/.local/opt/sbt/bin
path -o -a ~/.gem/ruby/2.5.0/bin
path -o -a /opt/texlive/2018/bin/x86_64-linux
