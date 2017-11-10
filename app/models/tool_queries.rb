class ToolQueries
  def topic_query
    WpApi.get_json_body('pages?slug=tools')
  end

  def tools_content_query(parent_id, taxonomy)
    WpApi.get_json_body("pages?type=content&parent=#{parent_id}&filter[topic_taxonomy]=#{taxonomy}")
  end

  def tools_standard_query(parent_id, taxonomy)
    WpApi.get_json_body("pages?type=standard_index&parent=#{parent_id}&filter[topic_taxonomy]=#{taxonomy}")
  end

  def tools_children(arr_a, arr_b)
    array = arr_a + arr_b
    array.sort_by { |hash| hash['title'].to_s }
  end
end
