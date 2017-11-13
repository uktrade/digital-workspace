module NewsHelper
  def news_cats(name, slug)
    link_to(name, link_news_top + link_news_category + slug)
  end

  def news_cat_for_title
    WpApi.get_json_body("news_categories/?slug=#{@slug}")
  end

  def news_cat_title
    news_cat_for_title.first['name']
  end

  def get_date(date)
    date = DateTime.parse(date)
    date.strftime('%d %B %Y') + date.strftime(' @ %H:%M GMT')
  end
end
