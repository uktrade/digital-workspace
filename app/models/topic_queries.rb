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
end
