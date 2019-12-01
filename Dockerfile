FROM debian:9
LABEL maintainer="kamino <kamino@imea.me>"
WORKDIR /root
EXPOSE 853

RUN \
    echo "deb http://mirrors.tencentyun.com/debian/ stretch main non-free contrib\ndeb http://mirrors.tencentyun.com/debian/ stretch-updates main non-free contrib\ndeb http://mirrors.tencentyun.com/debian/ stretch-backports main non-free contrib\ndeb-src http://mirrors.tencentyun.com/debian/ stretch main non-free contrib\ndeb-src http://mirrors.tencentyun.com/debian/ stretch-updates main non-free contrib\ndeb-src http://mirrors.tencentyun.com/debian/ stretch-backports main non-free contrib\ndeb http://mirrors.tencentyun.com/debian-security/ stretch/updates main non-free contrib\ndeb-src http://mirrors.tencentyun.com/debian-security/ stretch/updates main non-free contrib" > /etc/apt/sources.list && \
    apt update && \
    apt install -y wget build-essential libssl-dev libexpat1-dev && \
    cd /tmp && \
    wget http://ssr.imea.me/unbound-1.9.5.tar.gz && \
    tar -zxvf unbound-1.9.5.tar.gz && \
    cd unbound-1.9.5 && \
    ./configure && \
    make && \
    make install && \
    rm /tmp/* -rf && \
    apt autoremove -y wget build-essential libssl-dev libexpat1-dev

CMD ["unbound", "-b"]






