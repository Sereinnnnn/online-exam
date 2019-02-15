FROM java:8

MAINTAINER tangyi(1633736729@qq.com)

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /online-exam-auth

WORKDIR /online-exam-auth

EXPOSE 3000

ADD online-exam-auth.jar ./

ADD wait-for-it.sh /wait-for-it.sh

CMD java -Djava.security.egd=file:/dev/./urandom -jar -Xmn64m -Xms64m -Xmx128m online-exam-auth.jar