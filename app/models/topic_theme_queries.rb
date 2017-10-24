class TopicThemeQueries
  def initialize(slug)
    @slug = slug
  end

  def topic_theme_query(slug)
    WpApi.get_json_body("themes?slug=#{@slug}")
  end
end
