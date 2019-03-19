class HomePageQueries
  def popular_posts
    WpApi.get_json_body(
      'popular_pages',
      params: { orderby: 'menu_order', order: 'asc', per_page: 3, _embed: 1 }
    )
  end

  def posts_ministers
    WpApi.get_json_body(
      'news',
      params: { orderby: 'date', order: 'desc', per_page: 2, 'filter[news_categories]': 'ministers', _embed: 1 }
    )
  end

  def posts_antonia
    WpApi.get_json_body(
      'news',
      params: { orderby: 'date', order: 'desc', per_page: 2, 'filter[news_categories]': 'antonia', _embed: 1 }
    )
  end

  def posts_departmental
    WpApi.get_json_body(
      'news',
      params: { orderby: 'date', order: 'desc', per_page: 2, 'filter[news_categories]': 'departmental', _embed: 1 }
    )
  end

  def visualisations
    WpApi.get_custom_json_body('visualisation')
  end

  def howdois
    WpApi.get_json_body(
      'howdoi',
      params: { orderby: 'menu_order', order: 'desc', per_page: 10 }
    )
  end

  def main_query
    WpApi.get_json_body('news')
  end

  def main_comments_headers
    WpApi.get_headers('comments')
  end

  def quick_links_menu
    @quick_links_menu ||= WpApi.get_json_body('menus', params: { slug: 'homepage-quick-links-menu' })
  end

  def quick_links_menu_content
    quick_links_menu.first['acf']['menu'] if quick_links_menu.first
  end

  def quick_links_menu_title
    quick_links_menu.first['title']['rendered'] if quick_links_menu.first
  end
end
