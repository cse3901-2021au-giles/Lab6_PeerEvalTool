Rails.application.routes.draw do
  resources :students
  resources :instructors
  resources :evals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
