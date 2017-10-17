module FooterMenuHelper
  def footer_menu_1
    WpApi.get_json_body('menus?slug=networks')
  end

  def footer_menu_1_content
    footer_menu_1.first['acf']['menu']
  end

  def footer_menu_1_title
    footer_menu_1.first['title']['rendered']
  end

  def footer_menu_2
    WpApi.get_json_body('menus?slug=teams')
  end

  def footer_menu_2_content
    footer_menu_2.first['acf']['menu']
  end

  def footer_menu_2_title
    footer_menu_2.first['title']['rendered']
  end

  def footer_menu_3
    WpApi.get_json_body('menus?slug=sectors')
  end

  def footer_menu_3_content
    footer_menu_3.first['acf']['menu']
  end

  def footer_menu_3_title
    footer_menu_3.first['title']['rendered']
  end

  def footer_menu_4
    WpApi.get_json_body('menus?slug=uk-regions')
  end

  def footer_menu_4_content
    footer_menu_4.first['acf']['menu']
  end

  def footer_menu_4_title
    footer_menu_4.first['title']['rendered']
  end

  def footer_menu_5
    WpApi.get_json_body('menus?slug=international-regions')
  end

  def footer_menu_5_content
    footer_menu_5.first['acf']['menu']
  end

  def footer_menu_5_title
    footer_menu_5.first['title']['rendered']
  end
end
