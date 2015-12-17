FROM n3ziniuka5/ubuntu-oracle-jdk:14.04-JDK7

MAINTAINER Shih-Li Lin <t301000@gmail.com>

# 變更 apt-get 來源
RUN sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list

# 安裝套件
# https://docs.google.com/document/pub?id=1Xc9yt02x3BRoq5m1PJHBr81OOv69rEBy8LVG_84j9jc#h.pz6zzhs54gxj
RUN apt-get update &&  \
    apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6

# 清理
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 複製 startAi2.sh 到根目錄下
COPY scripts/startAi2.sh /startAi2.sh
RUN chmod 700 /startAi2.sh

# 網站專案根目錄掛載點
VOLUME ["/ai2"]

# 開放容器之 8888 port
EXPOSE 8888

# 預設執行之命令，以前景模式啟動 apache
CMD ["/startAi2.sh"]
