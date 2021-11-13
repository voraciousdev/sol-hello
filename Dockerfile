FROM rust:1.56.1
ENV PATH /root/.local/share/solana/install/active_release/bin:$PATH
RUN apt-get update -qq
RUN apt-get install -y bash vim
RUN bash -c "$(curl -sSfL https://release.solana.com/v1.8.3/install)"
RUN bash -c "$(curl -sSfL https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh)"
RUN . ~/.bashrc && nvm install --lts
RUN . ~/.bashrc && npm install -g yarn
RUN mkdir -p /volume/project
VOLUME /volume/project
WORKDIR /volume/project
ADD ./solana.sh .
ENTRYPOINT ["./solana.sh"]
CMD ["solana-test-validator"]
