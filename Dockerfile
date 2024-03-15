FROM ubuntu:24.04
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && apt-get install -y \
    sudo \
    nano \
    wget \
    curl \
    git
RUN useradd -G sudo -m -d /home/omer -s /bin/bash -p "$(openssl passwd -1 Omer.sen310322)" omer
USER omer
WORKDIR /home/omer
RUN mkdir hacking \
    && cd hacking \
    && curl -SL https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v24/pawned.sh > pawned.sh \
    && chmod 764 pawned.sh \
    && cd ..
RUN git config --global user.email "rosealfred468@gmail.com" \
    && git config --global user.name "alfredrose" \
    && git config --global url."https://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:@github.com/".insteadOf "https://github.com" \
    && mkdir -p github.com/alfredrose/
USER root
RUN curl -SL https://go.dev/dl/go1.22.1.linux-arm64.tar.gz \
    | tar xvz -C /usr/local
USER omer
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/omer/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"
