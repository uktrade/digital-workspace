class HowdoiQueryAll
  def howdoi_1_100
    WpApi.get_json_body('howdoi', params: { orderby: 'menu_order', per_page: 100 })
  end

  def howdoi_101_200
    WpApi.get_json_body('howdoi', params: { orderby: 'menu_order', per_page: 100, offset: 100 })
  end

  def howdoi_201_300
    WpApi.get_json_body('howdoi', params: { orderby: 'menu_order', per_page: 100, offset: 200 })
  end
end
