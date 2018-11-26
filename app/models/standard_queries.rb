class StandardQueries
  def initialize(slug)
    @slug = slug
  end

  def notifications_query(_slug)
    WpApi.get_json_body('pages', params: { per_page: 100, slug: @slug })
  end

  def page_query(_slug)
    WpApi.get_json_body('pages', params: { per_page: 100, slug: @slug })
  end

  def main_query(_slug)
    WpApi.get_json_body('pages', params: { type: 'standard_index', slug: @slug })
  end

  def standard_child_content_query(parent_id)
    WpApi.get_json_body('pages', params: { type: 'content', orderby: 'title', order: 'asc', per_page: 100, parent: parent_id })
  end

  def standard_child_standard_query(parent_id)
    WpApi.get_json_body('pages', params: { type: 'standard_index', orderby: 'title', order: 'asc', per_page: 100, parent: parent_id })
  end

  def content_children(arr_a, arr_b)
    array = arr_a + arr_b
    array.sort_by { |hash| hash['title'].to_s }
  end
end
