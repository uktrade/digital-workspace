Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]

  root to: 'home#index'
  get '/news-and-views', to: 'archive#index'
  get '/news-and-views/category/*path', to: 'archive#news_type'
  get '/news-and-views/*path', to: 'single#news'

  post '/news-and-views/*path', to: 'single#news'

  get '/working-at-dit', to: 'accordion#index'
  get '/working-at-dit/*path', to: 'topics#index'
  # get '/working-at-dit/*path/*path', to: 'topics#index'

  get '/about-dit', to: 'standard#index'
  get '/about-dit/*path', to: 'content#content'

  get '/tools', to: 'standard#index'
  get '/tools/*path', to: 'content#content'
  get '/tools/topic/*path', to: 'topics#index'

  get '/teams', to: 'standard#index'
  get '/teams/*path', to: 'content#content'

  get '/networks', to: 'standard#index'
  get '/networks/*path', to: 'content#content'

  get '/sectors', to: 'standard#index'
  get '/sectors/*path', to: 'content#content'

  get '/regions', to: 'standard#index'
  get '/regions/*path', to: 'content#content'

  get '/howdoi/*path', to: 'howdoi#content'
  get '/policies-guidance/*path', to: 'policy#content'
  get '/topic/*path', to: 'topics#index'
  get '/standard/*path', to: 'standard#index'
  get '/preview', to: 'preview#index'
  get '*path', to: 'content#index'
end
