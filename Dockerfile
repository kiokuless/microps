# Ubuntu 22.04 をベースイメージとして使用
FROM ubuntu:22.04

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y make build-essential git iproute2 iputils-ping netcat-openbsd sudo

# kiokuless ユーザーを作成し、sudo権限を与える
RUN useradd -m kiokuless && \
    echo "kiokuless ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/kiokuless && \
    chmod 0440 /etc/sudoers.d/kiokuless

# kiokuless ユーザーに切り替え
USER kiokuless
ENV USER=kiokuless

# 作業ディレクトリを設定
WORKDIR /workspace

# コンテナが起動し続けるようにtailコマンドを使用
CMD ["tail", "-f", "/dev/null"]
