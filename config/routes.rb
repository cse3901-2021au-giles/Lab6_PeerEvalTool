Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/signup',  to: 'students#new'
  get    '/edit',    to: 'students#edit'
  get    '/login',   to: 'sessions#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
