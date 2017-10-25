Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]

  root to: 'home#index'
  get '/news', to: 'archive#index'
  get '/news/category/', to: 'archive#index'
  get '/news/category/*path', to: 'archive#news_type'
  get '/news/*path', to: 'single#news'
  get '/working-at-dit', to: 'topics#index'
  get '/topic/*path', to: 'topics#index'
  get '/howdoi/*path', to: 'single#index'
  get '/policies-procedures/*path', to: 'single#index'
  get '/form-templates/*path', to: 'single#index'
  get '/preview', to: 'preview#index'
  get '*path', to: 'single#index'
end
