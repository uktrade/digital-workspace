module FooterMenuHelper
  def footer_menu
    WpApi.get_json_body('menus?slug=footer-menu')
  end

  def footer_menu_content
    footer_menu.first['acf']['menu']
  end

  def footer_menu_title
    footer_menu.first['title']['rendered']
  end
end
