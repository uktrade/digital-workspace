FROM ruby:2.5.3

# Install essentials
RUN apt-get update -qq && apt-get install -y build-essential less nodejs

# Get People Finder running
RUN mkdir /workspace
WORKDIR /workspace
COPY Gemfile /workspace/Gemfile
COPY Gemfile.lock /workspace/Gemfile.lock

RUN bundle install

COPY . /workspace
