class HomePageQueries
  def popular_posts
    WpApi.get_json_body(
      'popular_pages?orderby=menu_order&order=asc&per_page=3&_embed'
    )
  end

  def posts_ministers
    WpApi.get_json_body(
      'pages?type=news&orderby=date&order=desc&per_page=2&filter[news_category]=ministers&_embed'
    )
  end

  def posts_antonia
    WpApi.get_json_body(
      'pages?type=news&orderby=date&order=desc&per_page=2&filter[news_category]=antonia&_embed'
    )
  end

  def posts_departmental
    WpApi.get_json_body(
      'pages?type=news&orderby=date&order=desc&per_page=2&filter[news_category]=departmental&_embed'
    )
  end

  def howtos
    WpApi.get_json_body('pages?type=howto&orderby=date&order=desc&per_page=20')
  end
end
