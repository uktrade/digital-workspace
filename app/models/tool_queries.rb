class ToolQueries
  def initialize(slug)
    @slug = slug
  end
  
  def tools_query
    WpApi.get_json_body("pages?filter[topic_taxonomy]=#{@slug}&parent_slug=tools")
  end
end
