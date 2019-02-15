FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER tangyi(1633736729@qq.com)

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /online-exam-user

WORKDIR /online-exam-user

EXPOSE 4000

ADD online-exam-user.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar online-exam-user.jar