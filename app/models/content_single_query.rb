# frozen_string_literal: true

class ContentSingleQuery
  def initialize(slug)
    @slug = slug
  end

  def notifications_query(_slug)
    WpApi.get_json_body('pages', params: { per_page: 100, slug: @slug })
  end

  def type_query
    WpApi.get_json_body('pages', params: { type: 'content', slug: @slug })
  end
end
