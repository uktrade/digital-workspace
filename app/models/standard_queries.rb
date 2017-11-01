class StandardQueries
  def initialize(slug)
    @slug = slug
  end

  def main_query(_slug)
    WpApi.get_json_body("pages?type=standard_index&slug=#{@slug}")
  end

  def standard_child_query(parent_id)
    WpApi.get_json_body("pages?type=content&parent=#{parent_id}")
  end
end
