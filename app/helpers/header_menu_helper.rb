module HeaderMenuHelper
  def header_menu
    WpApi.get_json_body('menus?slug=header-menu')
  end
end
