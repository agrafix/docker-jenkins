FROM jpetazzo/dind
MAINTAINER Alexander Thiemann "mail@agrafix.net"

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
ADD http://mirrors.jenkins-ci.org/war/1.562/jenkins.war /opt/jenkins.war
RUN ln -sf /jenkins /root/.jenkins

RUN apt-get install -q -y python-setuptools
RUN easy_install supervisor
ADD ./supervisord.conf /etc/supervisord.conf

EXPOSE 8080
VOLUME ["/jenkins"]

ADD ./start.sh /start.sh
CMD ["/bin/bash", "start.sh"]
