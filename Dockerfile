FROM ubuntu:18.04

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN userdel -f www-data &&\
    if getent group www-data ; then groupdel www-data; fi &&\
    groupadd -g ${GROUP_ID} www-data &&\
    useradd -l -u ${USER_ID} -g www-data www-data &&\
    install -d -m 0755 -o www-data -g www-data /home/www-data &&\
    chown --changes --silent --no-dereference --recursive \
          --from=33:33 ${USER_ID}:${GROUP_ID} \
        /home/www-data


RUN apt-get update
RUN apt-get install -y git

RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN add-apt-repository ppa:ondrej/php

RUN ln -fs /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime
#RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get -y update

RUN apt-get install -y docker-ce docker-ce-cli containerd.io

RUN apt-get install -y php7.3

RUN curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker www-data

# RUN pecl install solr redis igbinary xdebug-2.5.0
# RUN docker-php-ext-enable solr redis igbinary xdebug

# ADD ./ports.conf /etc/apache2/ports.conf
# ADD ./default.conf /etc/apache2/sites-enabled/000-default.conf

RUN mkdir /home/www-data/work

WORKDIR /home/www-data/work

VOLUME /home/www-data/.ssh

RUN chmod -R 600 /home/www-data/.ssh


RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g uglify-js pm2

USER www-data