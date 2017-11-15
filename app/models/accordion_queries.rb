class AccordionQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query(_slug)
    WpApi.get_json_body("pages/?type=standard_index&slug=#{@slug}")
  end

  def accordion_theme_query(parent_slug)
    WpApi.get_json_body("theme_taxonomy/?filter[theme_taxonomy]=#{parent_slug}")
  end

  def self.accordion_theme_title_query(theme_slug)
    WpApi.get_json_body("themes?slug=#{theme_slug}")
  end

  def self.accordion_topic_query(theme_slug)
    WpApi.get_json_body("topics/?filter[theme_taxonomy]=#{theme_slug}&orderby=title&order=asc")
  end
end
