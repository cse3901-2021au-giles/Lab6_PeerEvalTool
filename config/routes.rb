Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :students
  resources :instructors
  resources :evals
  resources :teams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
