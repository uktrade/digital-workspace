FROM ruby:2.7.1

# Install essentials
RUN apt-get update -qq && apt-get install -y build-essential less nodejs

# Get People Finder running
RUN mkdir /workspace
WORKDIR /workspace
COPY Gemfile /workspace/Gemfile
COPY Gemfile.lock /workspace/Gemfile.lock

RUN gem install bundler:2.1.4
RUN bundle install --jobs=3

COPY . /workspace
