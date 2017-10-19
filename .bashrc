if [ -e /etc/bashrc ]; then
  . /etc/bashrc
fi

alias vi=vim

export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

type kubectl > /dev/null 2>&1 && source <(kubectl completion bash)

if [ docker-machine > /dev/null 2>&1 ]; then
  if [ $(docker-machine ls --filter name=default | wc -l) = 1 ]; then
    ~/msys2/create_docker_machine
  fi

  if [ "$(docker-machine status)" = "Stopped" ]; then
    docker-machine start
  fi

  eval "$(docker-machine env)"
fi
