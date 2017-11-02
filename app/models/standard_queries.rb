class StandardQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query(_slug)
    WpApi.get_json_body("pages?type=standard_index&slug=#{@slug}")
  end

  def standard_child_content_query(parent_id)
    WpApi.get_json_body("pages?type=content&orderby=title&order=asc&per_page=100&parent=#{parent_id}")
  end

  def standard_child_standard_query(parent_id)
    WpApi.get_json_body("pages?type=standard_index&orderby=title&order=asc&per_page=100&parent=#{parent_id}")
  end

  def content_children(arr_a, arr_b)
    arr_a + arr_b
  end
end
