FROM ubuntu:18.04
ENV LANG C.UTF-8

RUN apt-get update
RUN apt-get update && \
    apt-get install -y libsdl2-dev libsdl2-image-dev libsdl2-gfx-dev libsdl2-ttf-dev libsdl2-mixer-dev pkg-config && \
    apt-get install -y --no-install-recommends \
            zlib1g-dev libtinfo-dev libsqlite3-0 libsqlite3-dev ca-certificates g++ git curl gnupg2 && \
    (curl -sSL https://get.haskellstack.org/ | sh) && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/* /stack.tar.gz

ENV PATH /root/.local/bin:$PATH
ENV RESOLVER nightly-2019-07-02

RUN stack install --resolver=$RESOLVER sdl2 sdl2-image sdl2-gfx sdl2-ttf sdl2-mixer lens split splitmix executable-path random-shuffle tasty-discover tasty-quickcheck QuickCheck tasty-hunit ansi-terminal pretty-simple clock fsnotify

CMD ["stack"]
