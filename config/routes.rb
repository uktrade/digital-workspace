Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]

  root to: 'home#index'
  get '/news-and-views', to: 'archive#index'
  get '/news-and-views/category/*path', to: 'archive#news_type'
  get '/news-and-views/*path', to: 'single#news'
  get '/working-at-dit', to: 'accordion#index'
  get '/working-at-dit/*path', to: 'content#content'
  get '/about-us', to: 'content#content'
  get '/network', to: 'content#content'
  get '/data-hub', to: 'content#content'
  get '/tools', to: 'content#content'

  get '/policies-guidance/*path', to: 'policy#content'
  get '/content/*path', to: 'content#content'
  get '/topic/*path', to: 'topics#index'
  get '/howdoi/*path', to: 'accordion#index'
  get '/standard/*path', to: 'standard#index'
  get '/preview', to: 'preview#index'
  get '*path', to: 'single#index'
end
