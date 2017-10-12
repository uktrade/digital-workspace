class PageQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query
    WpApi.get_json_body("pages?slug=#{@slug}")
  end

  def main_comments_query
    WpApi.get_json_body("comments")
  end

  def main_comment_headers
    WpApi.get_headers('comments')
  end
end
