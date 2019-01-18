class AccordionQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query(_slug)
    WpApi.get_json_body('pages', params: { type: 'standard_index', slug: @slug })
  end

  def accordion_theme_query(parent_slug)
    WpApi.get_json_body('theme_taxonomy', params: { 'filter[theme_taxonomy]': parent_slug })
  end

  def self.accordion_theme_title_query(theme_slug)
    WpApi.get_json_body('themes', params: { slug: theme_slug })
  end

  def self.accordion_topic_query(theme_slug)
    WpApi.get_json_body('topics', params: { 'filter[theme_taxonomy]': theme_slug, orderby: 'title', order: 'asc', per_page: 50 })
  end
end
