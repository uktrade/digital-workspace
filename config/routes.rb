Rails.application.routes.draw do
  root to: 'home#index'
  get '/news', to: 'archive#index'
  get '/news/category/', to: 'archive#index'
  get '/news/category/*path', to: 'archive#news_type'
  get '/news/*path', to: 'single#news'
  get '*path', to: 'single#index'
end
