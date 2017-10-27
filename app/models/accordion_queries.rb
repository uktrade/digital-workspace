class AccordionQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query
    WpApi.get_json_body("howdoi?slug=#{@slug}")
  end

  def howdois_theme_query
    WpApi.get_json_body('theme_taxonomy?filter[theme_taxonomy]=working-in-government')
  end

  def howdois_topic_query
    WpApi.get_json_body('topics?theme_taxonomy=17')
  end
end
