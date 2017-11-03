class PageQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query
    WpApi.get_json_body("news?slug=#{@slug}")
  end

  def main_comments_query
    WpApi.get_json_body('comments?per_page=100')
  end

  def main_comment_headers
    WpApi.get_headers('comments')
  end

  def other_categories_query
    WpApi.get_json_body('news_categories')
  end
end
