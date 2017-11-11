class PageQueries
  def initialize(slug)
    @slug = slug
  end

  def header_menu
    WpApi.get_json_body('menus?slug=header-menu')
  end

  def main_query
    WpApi.get_json_body("news?slug=#{@slug}")
  end

  def main_comments_query(_id)
    WpApi.get_json_body("comments?per_page=100&post=#{_id}", false)
  end

  def self.comment_count_query(_id)
    WpApi.get_json_body("comments?per_page=100&post=#{_id}", false)
  end

  # def main_comment_headers
  #   WpApi.get_headers('comments', false)
  # end

  def main_comments_query_cache(_id)
    WpApi.get_json_body("comments?per_page=100&post=#{_id}", false)
  end

  # def main_comment_headers_cache
  #   WpApi.get_headers('comments', true)
  # end

  def other_categories_query
    WpApi.get_json_body('news_categories')
  end
end
