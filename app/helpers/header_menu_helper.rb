# frozen_string_literal: true

module HeaderMenuHelper
  def header_menu
    WpApi.get_json_body('menus', params: { slug: 'header-menu' })
  end

  def header_menu_content
    header_menu.first['acf']['menu'] if header_menu.first
  end

  def header_menu_title
    header_menu.first['title']['rendered'] if header_menu.first
  end
end
