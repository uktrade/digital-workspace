class TopicChildQueries
  def initialize(slug)
    @slug = slug
  end

  def topic_howdoi_query
    WpApi.get_json_body("howdoi?per_page=100&filter[topic_taxonomy]=#{@slug}&orderby=menu_order&order=desc")
  end

  def topic_policies_query
    WpApi.get_json_body("policies?per_page=100&filter[topic_taxonomy]=#{@slug}&orderby=menu_order&order=desc")
  end

  def topic_forms_query
    WpApi.get_json_body("topics?slug=#{@slug}")
  end
end
