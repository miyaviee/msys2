FROM base/archlinux

RUN sed -i 's@#en_US.UTF-8.*@en_US.UTF-8 UTF-8@g' /etc/locale.gen \
  && locale-gen

RUN ln -fs /usr/share/zoninfo/Asia/Tokyo /etc/localtime

RUN pacman -Syy \
  && pacman -S --noconfirm \
      gcc \
      make \
      zip \
      unzip \
      git \
      lua \
      ruby \
      python2 \
      python3 \
      python-pip \
      go \
      jre8-openjdk \
      scala \
      zsh \
      vim \
      docker \
      the_silver_searcher \
      openssh \
  && pacman -Scc --noconfirm

RUN chsh -s /bin/zsh \
  && mv /etc/zsh/zprofile /etc/zsh/profile.bak

RUN sed -i 's@#PermitRootLogin.*@PermitRootLogin yes@g' /etc/ssh/sshd_config \
  && sed -i 's@#HostKey /etc/ssh/ssh_host_rsa_key@HostKey /etc/ssh/ssh_host_rsa_key@g' /etc/ssh/sshd_config

RUN ssh-keygen -t rsa -b 2048 -N '' -f /etc/ssh/ssh_host_rsa_key \
  && chmod -R 600 /etc/ssh/ssh_host_rsa_key

RUN ssh-keygen -t rsa -b 2048 -N '' -f ~/.ssh/id_rsa \
  && cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys \
  && chmod -R 600 ~/.ssh

RUN curl -Lo /usr/local/bin/direnv https://github.com/direnv/direnv/releases/download/v2.13.1/direnv.linux-amd64 \
  && chmod +x /usr/local/bin/direnv

RUN curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl

CMD ["/sbin/sshd", "-D"]
