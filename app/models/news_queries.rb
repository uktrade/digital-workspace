class NewsQueries
  def main_query
    WpApi.get_json_body('pages?type=news&_embed')
  end

  def other_categories_query
    WpApi.get_json_body('news_category')
  end
end