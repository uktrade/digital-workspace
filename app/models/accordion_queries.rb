class AccordionQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query
    WpApi.get_json_body("howdoi/?slug=#{@slug}")
  end

  def topics_query
    WpApi.get_json_body("topics/")
  end

  def howdois_theme_query(parent_slug)
    WpApi.get_json_body("theme_taxonomy/?filter[theme_taxonomy]=#{@parent_slug}")
  end

  def howdois_topic_query(parent_topics_slug)
    WpApi.get_json_body("topics/?filter[theme_taxonomy]=#{@parent_topics_slug}")
  end
end
