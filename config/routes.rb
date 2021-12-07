Rails.application.routes.draw do
  resources :evaluates
  resources :ratings
  resources :courses
  resources :groups
  resources :memberships
  resources :welcomes
  resources :projects
  resources :assignments
  resources :users
  get '/welcomes/confirmation', to: 'welcomes#confirmation'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
 
  root 'welcomes#index'

  get  '/signup', to: 'welcomes#signup'
  get  '/login', to: 'welcomes#login'

  get '/users_signup', to: 'users#new'

end
