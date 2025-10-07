# Spack Tutorial に関する覚書

- 環境
  - dockerまたはpodmanでSpack公式チュートリアルのdockerイメージを使える環境を参加者自身に用意してもらう
  - 用意出来ない参加者に関してはAWSの環境を提供する

- 大筋の内容
  1. 概要&「1. Basic Installation Tutorial」: 村井さん
  2. 「4. Package Creation Tutorial」
  
- 環境: docker or podman ?
  - R-CCS cloudではpodmanしか使えないようなので、podmanがいいか
  - とはいえ、まずはdockerを使ってみるか
  - dockerの問題点
    - `share/spack/setup-env.sh`を読み込む際、`Error: SPACK_ROOT must point to spack's prefix...`のエラーが出た
    - `/mirror`のbinary cacheを使ってくれない(異なるhashのspecがconcretizeされる)。
    - 一般にはエミュレーションでやるべきではない; -> NG
  - podmanの問題点
    - チュートリアルの最初の`spack install gmake`で`qemu: uncaught target signal 11 (Segmentation fault) - core dumped`のエラー; -> NG
  - vanilla Linuxでやるのが良さそう -> cms12にdockerをインストール
    - cms12はcms12でおかしなspecを返してくる...
    - チュートリアルの説明の頭にある設定の部分(`spack tutorail y`)がおかしかっただけ; cms12でもSec4を完走できた
  - genoaでやってみる
    - R-CCS Cloudのログインノードにssh; `ssh otsukay@login.cloud.r-ccs.riken.jp`
    - genoaを対話的に利用; `srun -N 1 -p genoa --pty bash`
    - podmanの設定
      - `cat  > ~/.config/containers/storage.conf`
        ```
        [storage]
          driver = "overlay"
          graphroot = "/tmp/${USER}-podman-graph"
          runroot = "/tmp/${USER}-podman-run"
        ```
      - `cat > ~/.config/containers/containers.conf`
        ```
        [engine]
        cgroup_manager = "cgroupfs"
        ```
    - テスト
      - `podman pull ghcr.io/spack/tutorial:icpp25`
      - `podman run -it --security-opt label=disable  ghcr.io/spack/tutorial:icpp25`
      - Turtorial
        1. Basic Installation Tutorial
          - OK
        4. Package Creation Tutorial
          - OK

- 「Docker Desktopをインストールして最初のコンテナを動かす超入門（Mac版） by ChatGTP
  - インストール
    - `brew install --cask docker`
  - 色々やってみた

## Tutorial

1. [Basic Installation Tutorial](https://spack-tutorial.readthedocs.io/en/latest/tutorial_basics.html)
  - binary cacheからインストールできるところまで確認

2. [Environments Tutorial](https://spack-tutorial.readthedocs.io/en/latest/tutorial_environments.html)
  - 省略

3. [Configuration Tutorial](https://spack-tutorial.readthedocs.io/en/latest/tutorial_configuration.html)
  - 省略

4. [Package Creation Tutorial](https://spack-tutorial.readthedocs.io/en/latest/tutorial_packaging.html)
  - コンテナを起動
    ```
    docker run -it ghcr.io/spack/tutorial:icpp25
    ```
  - 準備
    ```
    git clone --depth=2 --branch=releases/v1.0 https://github.com/spack/spack
    export SPACK_ROOT=$HOME/spack; . $SPACK_ROOT/share/spack/setup-env.sh; cd $SPACK_ROOT
    cd  ~/spack; . ./share/spack/setup-env.sh
    spack repo update builtin --tag v2025.07.0
    spack tutorial -y
    spack bootstrap now
    spack compiler find
    ``` 
  - Getting Started
    ```
    spack repo create $HOME/my_pkgs tutorial
    spack repo add $HOME/my_pkgs/spack_repo/tutorial
    spack repo list
    spack config get repos
    ```
  - Creating the Package File
    ```
    export EDITOR=emacs
    spack create --name tutorial-mpileaks https://github.com/LLNL/mpileaks/archive/refs/tags/v1.0.tar.gz
    spack checksum tutorial-mpileaks 1.0
    spack install tutorial-mpileaks
    ```
  - 以下全て完走
