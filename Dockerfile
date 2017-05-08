FROM ubuntu
# install system-dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    libffi-dev \
    libjpeg8-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    python-dev \
    python-pip \
    python-setuptools \
    python-software-properties \
    software-properties-common \
    zlib1g-dev
# install java
RUN add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y openjdk-7-jre
# install lein
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
# install pip
RUN easy_install pip
# install streamparse
RUN pip install streamparse
