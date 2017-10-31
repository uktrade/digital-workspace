class StandardQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query(_slug)
    WpApi.get_json_body("pages?type=standard_index&slug=#{@slug}")
  end

  def themes_query
    WpApi.get_json_body('themes')
  end

  def standard_theme_query(parent_slug)
    WpApi.get_json_body("theme_taxonomy/?filter[theme_taxonomy]=#{parent_slug}")
  end

  def self.standard_topic_query(theme_slug)
    WpApi.get_json_body("topics/?filter[theme_taxonomy]=#{theme_slug}")
  end
end
