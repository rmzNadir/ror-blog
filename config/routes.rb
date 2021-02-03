Rails.application.routes.draw do
  devise_for :users
  resources :articles
  # get '/articles'
  # post '/articles'
  # delete '/articles'
  # get '/articles/new'
  # get '/articles/:id'
  # get '/articles/:id/edit'
  # patch '/articles/:id'
  # put '/articles/:id'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
