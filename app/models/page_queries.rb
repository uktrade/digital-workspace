class PageQueries
  def initialize(slug)
    @slug = slug
  end

  def header_menu
    WpApi.get_json_body('menus', params: { slug: 'header-menu' })
  end

  def main_query
    WpApi.get_json_body('news', params: { slug: @slug })
  end

  def main_comments_query(id)
    WpApi.get_json_body('comments', params: { per_page: 100, post: id }, use_cache: false)
  end

  def self.comment_count_query(id)
    WpApi.get_json_body('comments', params: { per_page: 100, post: id }, use_cache: false)
  end

  # def main_comment_headers
  #   WpApi.get_headers('comments', false)
  # end

  def main_comments_query_cache(id)
    WpApi.get_json_body('comments', params: { per_page: 100, post: id }, use_cache: false)
  end

  # def main_comment_headers_cache
  #   WpApi.get_headers('comments', true)
  # end

  def other_categories_query
    WpApi.get_json_body('news_categories')
  end
end
