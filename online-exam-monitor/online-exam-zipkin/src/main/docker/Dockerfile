FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER tangyi(1633736729@qq.com)

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /online-exam-zipkin

WORKDIR /online-exam-zipkin

EXPOSE 9411

ADD online-exam-zipkin.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=test -jar online-exam-zipkin.jar