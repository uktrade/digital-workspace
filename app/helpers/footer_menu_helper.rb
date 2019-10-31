# frozen_string_literal: true

module FooterMenuHelper
  def footer_menu
    WpApi.get_json_body('menus', params: { slug: 'footer-menu' })
  end

  def footer_menu_content
    footer_menu.first['acf']['menu'] if footer_menu.first
  end

  def footer_menu_title
    footer_menu.first['title']['rendered'] if footer_menu.first
  end
end
