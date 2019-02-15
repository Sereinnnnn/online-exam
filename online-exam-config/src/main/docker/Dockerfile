FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER tangyi(1633736729@qq.com)

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /online-exam-config

WORKDIR /online-exam-config

EXPOSE 8888

ADD online-exam-config.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=test -jar -Xmn64m -Xms64m -Xmx64m online-exam-config.jar