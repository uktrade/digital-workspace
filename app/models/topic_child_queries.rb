class TopicChildQueries
  def initialize(slug)
    @slug = slug
  end

  def topic_child_query
    WpApi.get_json_body("topics")
  end
end
