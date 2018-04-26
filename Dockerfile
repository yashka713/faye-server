FROM ruby:2.5.0
# prepare environment
RUN apt-get update -qq
RUN apt-get install -y -qq build-essential
RUN apt-get install -y -qq libpq-dev

RUN mkdir -p /faye

WORKDIR /faye

ADD Gemfile /faye/Gemfile

ADD Gemfile.lock /faye/Gemfile.lock

RUN bundle update
RUN bundle install
ADD . /faye
