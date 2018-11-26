class ToolQueries
  def initialize(slug)
    @slug = slug
  end

  def tools_query
    WpApi.get_json_body('pages', params: { 'filter[topic_taxonomy]': @slug, parent_slug: 'tools', orderby: 'title', order: 'asc' })
  end
end
