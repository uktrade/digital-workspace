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

  def self.howdois_topic_query(theme_slug)
    WpApi.get_json_body("topics/?filter[theme_taxonomy]=#{theme_slug}")
  end
end
