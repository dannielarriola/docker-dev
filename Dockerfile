# Puede ser 5.6, 7.0, 7.1
ARG  PHP_VERSION=7.1
FROM moodlehq/moodle-php-apache:${PHP_VERSION}


RUN apt-get update
RUN apt-get install -y git

RUN pecl install solr redis igbinary xdebug-2.5.0
RUN docker-php-ext-enable solr redis igbinary xdebug

RUN mkdir /work

WORKDIR /work

RUN mkdir -p /root/.ssh

COPY ./keys /root/.ssh/

RUN chmod -R 600 /root/.ssh/


RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g uglify-js pm2