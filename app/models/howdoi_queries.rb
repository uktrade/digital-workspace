# frozen_string_literal: true

class HowdoiQueries
  def initialize(slug)
    @slug = slug
  end

  def howdoi_query
    WpApi.get_json_body('howdoi', params: { slug: @slug })
  end

  def topics_related_news
    WpApi.get_json_body('news', params: { 'filter[topic_taxonomy]': @slug, per_page: 5 })
  end
end
