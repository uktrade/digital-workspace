class TopicThemeQueries
  def initialize(slug)
    @slug = slug
  end

  def topic_theme_query
    WpApi.get_json_body('themes', params: { slug: @slug })
  end
end
