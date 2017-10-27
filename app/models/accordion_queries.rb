class AccordionQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query(slug)
    WpApi.get_json_body("howdoi?slug=#{@slug}")
  end
end
