class TopicChildQueries
  def topic_howdoi_query
    WpApi.get_json_body("howdoi?filter[topic_taxonomy]=")
  end

  def topic_policies_query
    WpApi.get_json_body("pages")
    # WpApi.get_json_body("policies?filter[topic_taxonomy]=")
  end

  def topic_forms_query
    WpApi.get_json_body("pages")
  end
end
