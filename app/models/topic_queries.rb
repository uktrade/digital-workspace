class TopicQueries
  def topic_query
    WpApi.get_json_body('topics')
  end

  def topic_selector
    WpApi.get_json_body('themes')
  end
end
