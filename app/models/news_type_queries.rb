class NewsTypeQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query(page)
    path = "pages?type=news&_embed&filter[news_category]=#{@slug}"
    path += "&per_page=#{Paginator::PER_PAGE}&page=#{page}"
    WpApi.get_json_body(path)
  end

  def main_query_headers(page)
    path = "pages?type=news&_embed&filter[news_category]=#{@slug}"
    path += "&per_page=#{Paginator::PER_PAGE}&page=#{page}"
    WpApi.get_headers(path)
  end

  def main_comments_headers
    WpApi.get_headers('comments')
  end

  def other_categories_query
    WpApi.get_json_body('news_category')
  end
end
