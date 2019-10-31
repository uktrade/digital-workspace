# frozen_string_literal: true

class TopicQueries
  def initialize(slug)
    @slug = slug
  end

  def topic_query
    WpApi.get_json_body('topics', params: { slug: @slug })
  end

  def topic_selector
    WpApi.get_json_body('themes')
  end

  def topics_related_news
    WpApi.get_json_body('news', params: { 'filter[topic_taxonomy]': @slug, per_page: 5 })
  end
end
