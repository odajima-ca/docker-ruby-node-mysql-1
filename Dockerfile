FROM ruby:2.4.1

ENV LANG C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs \
                       mysql-client \
                       libmysqlclient-dev \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN gem install bundler
RUN npm install -g yarn
