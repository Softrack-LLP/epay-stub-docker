FROM java:8

MAINTAINER Magzhan Karassayev, magzhan.karasayev@allpay.kz

######### env
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf
RUN echo "nameserver 8.8.4.4" >> /etc/resolv.conf
RUN mv /etc/localtime /etc/localtime.bak
RUN ln -s /usr/share/zoneinfo/Asia/Almaty /etc/localtime

######### kisc signer

# copy jar
RUN mkdir -p /jars
# RUN yum install -y wget
RUN wget -O /jars/app.jar https://github.com/Softrack-LLP/epay-stub/releases/download/0.0.2/epay-stub.jar

######### java

# RUN yum install -y java-1.8.0-openjdk ; yum clean all

######### CMD

CMD ["java", "$JVM_ARGS", "-jar", "/jars/app.jar", "$JAVA_APP_ARGS"]