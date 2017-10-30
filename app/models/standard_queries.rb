class StandardQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query(slug)
    WpApi.get_json_body("pages?type=standard_index&slug=#{@slug}")
  end

  def topics_query
  	WpApi.get_json_body("themes?")
  end
end
