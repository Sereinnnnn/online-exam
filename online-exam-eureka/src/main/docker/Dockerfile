FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER tangyi(1633736729@qq.com)

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /online-exam-eureka

WORKDIR /online-exam-eureka

EXPOSE 8765

ADD online-exam-eureka.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar -Xmn64m -Xms64m -Xmx64m online-exam-eureka.jar