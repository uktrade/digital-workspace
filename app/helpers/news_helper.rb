module NewsHelper
  def news_cats(name, slug)
    link_to(name, '/news/category/' + slug)
  end
end
