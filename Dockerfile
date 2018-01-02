FROM ruby:2.4.3

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libmysqlclient-dev \
        mysql-client \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        nodejs \
        yarn \
    && rm -rf /var/lib/apt/lists/*

RUN bundle config --global disable_version_check true \
    && bundle config --global build.nokogiri --use-system-libraries \
    && bundle config --global jobs 4

WORKDIR /app
