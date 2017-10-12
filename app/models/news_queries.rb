class NewsQueries
  def main_query
    WpApi.get_json_body('pages?type=news&_embed')
  end

  def main_query_headers
    WpApi.get_headers('pages?type=news&_embed')
  end

  def other_categories_query
    WpApi.get_json_body('news_category')
  end

  def main_comments_headers
    WpApi.get_headers('comments')
  end
end
