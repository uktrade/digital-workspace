module HeaderMenuHelper
  def header_menu
    WpApi.get_json_body('menus?slug=header-menu')
  end

  def header_menu_content
    header_menu.first['acf']['menu']
  end

  def header_menu_title
    header_menu.first['title']['rendered']
  end
end
