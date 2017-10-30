class TopicQueries
  def initialize(slug)
    @slug = slug
  end

  def topic_query
    WpApi.get_json_body("topics?slug=#{@slug}")
  end

  def topic_selector
    WpApi.get_json_body('themes')
  end

  def topics_related_news
    WpApi.get_json_body("news?per_page=5")
    # WpApi.get_json_body("news?filter[topic_taxonomy]=#{@slug}?per_page=5")
  end
end
