if [ -e /etc/bashrc ]; then
  . /etc/bashrc
fi

alias vi=vim

export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

which kubectl > /dev/null 2>&1 && source <(kubectl completion bash)
