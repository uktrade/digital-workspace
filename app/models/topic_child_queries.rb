class TopicChildQueries
  def topic_howdoi_query
    WpApi.get_json_body('howdoi')
  end

  def topic_policies_query
    WpApi.get_json_body('policies')
  end

  def topic_forms_query
    WpApi.get_json_body('pages')
  end
end
