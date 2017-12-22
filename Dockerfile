FROM base/archlinux

RUN sed -i 's@#en_US.UTF-8.*@en_US.UTF-8 UTF-8@g' /etc/locale.gen \
  && locale-gen

RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN pacman -Syu --noconfirm \
  && pacman -S --noconfirm \
    gcc \
    make \
    automake \
    autoconf \
    zip \
    unzip \
    git \
    luajit \
    ruby \
    python \
    python-pip \
    go \
    nodejs \
    npm \
    zsh \
    neovim \
    docker \
    ripgrep \
    openssh \
  && pacman -Scc --noconfirm

RUN chsh -s /bin/zsh \
  && mv /etc/zsh/zprofile /etc/zsh/zprofile.bak

RUN sed -i 's@#PermitRootLogin.*@PermitRootLogin yes@g' /etc/ssh/sshd_config \
  && sed -i 's@#HostKey /etc/ssh/ssh_host_rsa_key@HostKey /etc/ssh/ssh_host_rsa_key@g' /etc/ssh/sshd_config \
  && sed -i 's@#Port.*@Port 2222@g' /etc/ssh/sshd_config

RUN curl -Lo /usr/local/bin/direnv https://github.com/direnv/direnv/releases/download/v2.13.1/direnv.linux-amd64 \
  && chmod +x /usr/local/bin/direnv

ADD ./run.sh /run.sh

EXPOSE 2222

CMD ["/run.sh"]
