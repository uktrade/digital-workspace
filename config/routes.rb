Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]

  root to: 'home#index'

  get '/search/', to: 'search#index'

  get '/news-and-views', to: 'archive#index'
  get '/news-and-views/category/*path', to: 'archive#news_type'
  get '/news-and-views/*path', to: 'single#news'

  post '/news-and-views/*path', to: 'single#news'

  get '/working-at-dit', to: 'accordion#index'
  get '/working-at-dit/how-do-i/*path', to: 'howdoi#content'
  get '/working-at-dit/policies-and-guidance/*path', to: 'policy#content'
  get '/working-at-dit/*path', to: 'topics#index'

  get '/about-us', to: 'standard#index'
  get '/about-us/*path', to: 'standard#index'
  # get '/about-us/content/*path', to: 'content#content'

  get '/tools', to: 'standard#index'
  get '/tools/standard-index/*path', to: 'standard#index'
  get '/tools/content/*path', to: 'content#content'

  get '/teams', to: 'standard#index'
  get '/teams/*path', to: 'content#content'

  get '/networks', to: 'standard#index'
  get '/networks/*path', to: 'content#content'

  get '/sectors', to: 'standard#index'
  get '/sectors/*path', to: 'content#content'

  get '/regions', to: 'standard#index'
  get '/regions/*path', to: 'content#content'

  # deprecate lines 41-44 after about-us slug change in CMS is complete
  get '/about-dit', to: 'standard#index'
  get '/about-dit/*path', to: 'standard#index'

  get '*path', to: 'content#content'
end
