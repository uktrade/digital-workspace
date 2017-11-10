class ToolQueries


  def topic_query
     WpApi.get_json_body("pages?slug=tools")
  end

  def tools_content_query(parent_id)
    WpApi.get_json_body("pages?type=content&orderby=title&order=asc&per_page=100&parent=#{parent_id}&filter[topic_taxonomy]=it-tech-support")
  end

  def tools_standard_query(parent_id)
    WpApi.get_json_body("pages?type=standard_index&orderby=title&order=asc&per_page=100&parent=#{parent_id}&filter[topic_taxonomy]=it-tech-support")
  end

  def tools_children(arr_a, arr_b)
    array = arr_a + arr_b
    array.sort_by { |hash| hash['title'].to_s }
  end
end
