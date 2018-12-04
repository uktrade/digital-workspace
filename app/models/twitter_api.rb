require 'twitter'

class TwitterApi
  def self.public_tweets
    return [] unless ENV['TWITTER_KEY']

    # `count` parameter includes replies and RTs
    Rails.cache.fetch('twitter_feed', expires_in: 60) do
      client.user_timeline('tradegovuk', count: 25, exclude_replies: true, include_rts: false).first(3)
    end
  end

  def self.client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
    end
  end
end
