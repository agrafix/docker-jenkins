FROM stackbrew/ubuntu:14.04
MAINTAINER Allan Espinosa "allan.espinosa@outlook.com"
MAINTAINER Alexander Thiemann "mail@agrafix.net"

RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
ADD http://mirrors.jenkins-ci.org/war/1.592/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

RUN apt-get install -q -y python-setuptools
RUN easy_install supervisor
ADD ./supervisord.conf /etc/supervisord.conf

EXPOSE 8080
VOLUME ["/jenkins"]

ADD ./start.sh /start.sh
CMD ["/bin/bash", "start.sh"]
