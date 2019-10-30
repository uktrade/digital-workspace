# frozen_string_literal: true

Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]

  # Redirects
  get '/working-at-dit/policies-and-guidance/key-eu-exit-information', to: redirect('/brexit-hub')
  get '/working-at-dit/eu-exit', to: redirect('/working-at-dit/brexit')

  # On occasion, intermittent OAuth issues will cause users to be redirected to this path,
  # which doesn't exist. This at least gets them to the homepage instead of a 404 page.
  get '/auth/failure' => redirect('/')

  root to: 'home#index'

  get '/search/', to: 'search#index'

  post '/report_problem', to: 'report#index'

  get '/news-and-views', to: 'archive#index'
  get '/news-and-views/category/*path', to: 'archive#news_type'
  get '/news-and-views/*path', to: 'single#news'

  post '/news-and-views/*path', to: 'single#news'

  get '/working-at-dit', to: 'accordion#index'
  get '/working-at-dit/archive/how-do-i/', to: 'archive#howdoi'
  get '/working-at-dit/how-do-i/*path', to: 'howdoi#content'
  get '/working-at-dit/policies-and-guidance/*path', to: 'policy#content'
  get '/working-at-dit/*path', to: 'topics#index'

  get '/about-us', to: 'standard#index'
  get '/about-us/*path', to: 'standard#index'

  get '/brexit-hub', to: 'standard#index'
  get '/brexit-hub/*path', to: 'standard#index'

  get '/tools', to: 'standard#index'
  get '/tools/*path', to: 'tools#index'

  get '/teams', to: 'standard#index'
  get '/teams/*path', to: 'standard#index'

  get '/networks', to: 'standard#index'
  get '/networks/*path', to: 'standard#index'

  get '/sectors', to: 'standard#index'
  get '/sectors/*path', to: 'standard#index'

  get '/regions', to: 'standard#index'
  get '/regions/*path', to: 'standard#index'

  health_check_routes

  get '*path', to: 'content#content'
end
