FROM ruby:2.5

RUN mkdir /deps
WORKDIR /deps

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundle && \
    gem update --system && \
    bundle install --without system_tests