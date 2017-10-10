module ApplicationHelper
  def parsed_tweet(tweet)
    TweetParser.new(tweet).parse.html_safe
  end

  def truncate_excerpt(text)
    html_text = truncate(text, :length => 200, :omission => "..." , :escape => false)
    strip_tags(html_text)
  end

  def read_more(link)
      link_to("Read more", link)
  end
end
