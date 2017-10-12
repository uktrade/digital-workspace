class PageQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query
    WpApi.get_json_body("pages?slug=#{@slug}")
  end
end
