class StandardQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query(_slug)
    WpApi.get_json_body("pages?type=standard_index&slug=#{@slug}")
  end

  def standard_child_query(_slug)
    WpApi.get_json_body('pages?type=content')
  end
end
