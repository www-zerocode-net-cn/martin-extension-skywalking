FROM erdonline/jdk8-yum-go:latest

MAINTAINER martin114@foxmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /martin-extension-skywalking

WORKDIR /martin-extension-skywalking

EXPOSE 9602

ADD ./martin-extension/martin-extension-skywalking/target/martin-extension-skywalking.xjar ./

ADD ./martin-extension/martin-extension-skywalking/target/xjar.go ./

RUN go version

RUN go build xjar.go

ENTRYPOINT ./xjar java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar martin-extension-skywalking.xjar
