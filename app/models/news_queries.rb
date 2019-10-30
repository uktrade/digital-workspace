# frozen_string_literal: true

class NewsQueries
  def main_query(page)
    WpApi.get_json_body(
      'news',
      params: { _embed: 1, per_page: Paginator::PER_PAGE, page: page }
    )
  end

  def main_query_headers(page)
    path = "news?_embed&per_page=#{Paginator::PER_PAGE}&page=#{page}"
    WpApi.get_headers(path)
  end

  def other_categories_query
    WpApi.get_json_body('news_categories')
  end

  def main_comments_headers
    WpApi.get_headers('comments')
  end
end
