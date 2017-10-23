class TopicQueries
  def main_query
    WpApi.get_json_body('pages?type=topic')
  end
end
