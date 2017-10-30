Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]

  root to: 'home#index'
  get '/news-and-views', to: 'archive#index'
  get '/news-and-views/category/*path', to: 'archive#news_type'
  get '/news-and-views/*path', to: 'single#news'
  get '/working-at-dit', to: 'standard#index'
  get '/working-at-dit/*path', to: 'topics#index'
  get '/topic/*path', to: 'topics#index'
  get '/howdoi/*path', to: 'accordion#index'
  get '/policies-procedures/*path', to: 'single#index'
  get '/form-templates/*path', to: 'single#index'
  get '/preview', to: 'preview#index'
  get '/accordion', to: 'accordion#index'
  get '/content/*path', to: 'content#content'
  get '/policies-guidance/*path', to: 'policy#content'
  get '/standard/*path', to: 'standard#index'
  get '*path', to: 'single#index'
end
