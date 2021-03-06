# frozen_string_literal: true

class TopicChildQueries
  def initialize(slug)
    @slug = slug
  end

  def topic_howdoi_query
    WpApi.get_json_body(
      'howdoi',
      params: {
        per_page: 100,
        'filter[topic_taxonomy]': @slug,
        orderby: 'menu_order',
        order: 'desc'
      }
    )
  end

  def topic_policies_query
    WpApi.get_json_body(
      'policies',
      params: {
        per_page: 100,
        'filter[topic_taxonomy]': @slug,
        orderby: 'menu_order',
        order: 'desc'
      }
    )
  end

  def topic_forms_query
    WpApi.get_json_body('topics', params: { slug: @slug })
  end
end
