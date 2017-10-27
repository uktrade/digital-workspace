class AccordionQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query(slug)
    WpApi.get_json_body("howdoi?slug=#{@slug}")
  end

  def howdois_theme_query
    WpApi.get_json_body("themes")
  end

  def howdois_topic_query
    WpApi.get_json_body("topics?filter[theme_taxonomy]=0")
  end
end
