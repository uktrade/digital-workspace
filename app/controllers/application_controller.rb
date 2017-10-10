require 'httparty'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_page

  def set_page
    @footer_menu_1_content = footer_menu_1_content
  end

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

  before_action :ensure_sso_user

  def current_user
    User.new(session[:auth_user])
  end

  private

  def ensure_sso_user
    session[:auth_user] || redirect_to('/auth/ditsso_internal/')
  end
end
