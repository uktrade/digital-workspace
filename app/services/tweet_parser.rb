# frozen_string_literal: true

class TweetParser
  include ActionView::Helpers::UrlHelper

  def initialize(tweet)
    @tweet = tweet
    @parsed_tweet = tweet.text.dup
  end

  def parse
    parse_urls
    parse_media

    @parsed_tweet
  end

  private

  def parse_urls
    @tweet.urls.each do |entity|
      @parsed_tweet.sub!(entity.url.to_s, html_link(entity))
    end
  end

  def parse_media
    @tweet.media.each do |entity|
      @parsed_tweet.sub!(entity.url.to_s, html_link(entity))
    end
  end

  def html_link(entity)
    link_to(entity.display_url.to_s, entity.expanded_url.to_s, target: '_blank')
  end
end
