require 'twitter'

class TwitterApi
  def self.public_tweets
    return [] unless ENV['TWITTER_KEY']
    # we only display 3 tweets, but "count" is taken before filtering out replies and rts, so overegged this
    # client.user_timeline('DannnBeckett', count: 3)
    client.user_timeline('GOVUK', count: 100, exclude_replies: true, include_rts: false)
  end

  def self.client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
    end
  end
end
