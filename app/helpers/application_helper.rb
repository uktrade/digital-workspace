module ApplicationHelper
  def parsed_tweet(tweet)
    TweetParser.new(tweet).parse.html_safe
  end
end
