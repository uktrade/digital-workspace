class TopicChildQueries
  def topic_howdoi_query
    WpApi.get_json_body('howdoi?per_page=100&topic_taxonomy=24')
  end

  def topic_policies_query
    WpApi.get_json_body('policies')
  end

  def topic_forms_query
    WpApi.get_json_body('pages')
  end
end
