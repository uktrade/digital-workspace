class ContentQueries
  def main_query
    WpApi.get_json_body('pages?type=content')
  end
end
