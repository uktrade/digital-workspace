Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]

  root to: 'home#index'
  get '/news', to: 'archive#index'
  get '/news/category/', to: 'archive#index'
  get '/news/category/*path', to: 'archive#news_type'
  get '/news/*path', to: 'single#news'
  get '/tools', to: 'content#index'
  get '/tools/*path', to: 'content#content'
  get '*path', to: 'single#index'
end
