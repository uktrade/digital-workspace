# frozen_string_literal: true

class ContentQueries
  def main_query
    WpApi.get_json_body('pages', params: { type: 'content' })
  end
end
