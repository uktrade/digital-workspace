module FooterMenuHelper
  def footer_menu_1
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/menus?slug=footer-menu-1')
    JSON.parse(response.body)
  end

  def footer_menu_1_content
    footer_menu_1.first['acf']['menu']
  end

  def footer_menu_2
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/menus?slug=footer-menu-2')
    JSON.parse(response.body)
  end

  def footer_menu_2_content
    footer_menu_2.first['acf']['menu']
  end

  def footer_menu_3
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/menus?slug=footer-menu-3')
    JSON.parse(response.body)
  end

  def footer_menu_3_content
    footer_menu_3.first['acf']['menu']
  end

  def footer_menu_4
    response = HTTParty.get('https://uat-dit.useconnect.co.uk/wp-json/wp/v2/menus?slug=footer-menu-4')
    JSON.parse(response.body)
  end

  def footer_menu_4_content
    footer_menu_4.first['acf']['menu']
  end
end
