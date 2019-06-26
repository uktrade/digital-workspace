require 'rss'

GovukLink = Struct.new(:title, :url, :summary, :updated_at)

class GovukFeed
  FEED_URL = 'https://www.gov.uk/search/news-and-communications.atom?organisations%5B%5D=department-for-international-trade'

  def news_feed(count = 5)
    Rails.cache.fetch('govuk_rss_feed', expires_in: 30.minutes) do
      URI.parse(FEED_URL).open do |rss|
        feed = RSS::Parser.parse(rss)
        feed.items.first(count).map do |item|
          GovukLink.new(item.title.content, item.link.href, item.summary.content, item.updated.content)
        end
      end
    end
  rescue
    []
  end
end
