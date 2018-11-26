class PolicyQueries
  def initialize(slug)
    @slug = slug
  end

  def policy_query
    WpApi.get_json_body('policies', params: { slug: @slug })
  end

  def topics_related_news
    WpApi.get_json_body('news', params: { 'filter[topic_taxonomy]': @slug, per_page: 5 })
  end
end
