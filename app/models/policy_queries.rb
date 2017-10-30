class PolicyQueries
  def initialize(slug)
    @slug = slug
  end

  def policy_query
    WpApi.get_json_body("policies?slug=#{@slug}")
  end
end
