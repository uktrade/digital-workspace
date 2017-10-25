class HomePageQueries
  def popular_posts
    WpApi.get_json_body(
      'popular_pages?orderby=menu_order&order=asc&per_page=3&_embed'
    )
  end

  def posts_ministers
    WpApi.get_json_body(
      'news?orderby=date&order=desc&per_page=2&filter[news_categories]=ministers&_embed'
    )
  end

  def posts_antonia
    WpApi.get_json_body(
      'news?orderby=date&order=desc&per_page=2&filter[news_categories]=antonia&_embed'
    )
  end

  def posts_departmental
    WpApi.get_json_body(
      'news?orderby=date&order=desc&per_page=2&filter[news_categories]=departmental&_embed'
    )
  end

  def howdois
    WpApi.get_json_body('howdoi?orderby=date&order=desc&per_page=20')
  end

  def main_query
    WpApi.get_json_body('news')
  end

  def main_comments_headers
    WpApi.get_headers('comments')
  end
end
