FROM ubuntu
RUN apt-get update -y
# install system-dependencies
RUN apt-get install gcc -y
RUN apt-get install python-dev -y
RUN apt-get install python-pip -y
RUN apt-get install libffi-dev -y
RUN apt-get install libjpeg8-dev -y
RUN apt-get install libssl-dev -y
RUN apt-get install libxml2-dev -y
RUN apt-get install libxslt1-dev -y
RUN apt-get install python-dev -y
RUN apt-get install zlib1g-dev -y
# install pip
RUN apt-get install python-setuptools -y
RUN easy_install pip
# install java
RUN apt-get install software-properties-common python-software-properties -y
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update -y
RUN apt-get install openjdk-7-jre -y
# install lein
RUN apt-get install curl -y
RUN mkdir /root/bin
RUN curl -o /root/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN chmod 755 /root/bin/lein
RUN /root/bin/lein
ENV PATH=$PATH:/root/bin
ENV LEIN_ROOT=true
# install storm
RUN cd /
RUN curl -O http://mirror.rise.ph/apache/storm/apache-storm-1.0.2/apache-storm-1.0.2.tar.gz
RUN tar -xvf apache-storm-1.0.2.tar.gz
ENV PATH=$PATH:/apache-storm-1.0.2/bin
# install streamparse
RUN pip install streamparse
