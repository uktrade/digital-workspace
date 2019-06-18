require 'twitter'

class TwitterApi
  USERS = ['tradegovuk', 'AntoniaRomeoUK']

  def self.public_tweets
    return [] unless ENV['TWITTER_KEY']

    Rails.cache.fetch('twitter_feed', expires_in: 30.minutes) do
      tweets = USERS.map do |user|
        # `count` parameter includes replies and RTs, so we aim high to make sure enough
        # "real" tweets are included
        client.user_timeline(user, count: 25, exclude_replies: true, include_rts: false)        
      end.flatten.sort {|a,b| b.created_at <=> a.created_at }.first(3)
    end
  rescue => error
    Raven.capture_exception(error)
    []
  end

  def self.client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
    end
  end
end
