class ContentSingleQuery
  def initialize(slug)
    @slug = slug
  end

  def type_query
    WpApi.get_json_body("pages?type=content&slug=#{@slug}")
  end
end
