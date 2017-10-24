class TopicQueries
  def topic_parent_query
    WpApi.get_json_body('pages?type=topic')
  end

  def topic_child_query
    WpApi.get_json_body('pages?type=topic')
  end
end
