Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/student_signup',  to: 'students#new'
  get    '/student_edit',    to: 'students#edit'
  
  get    '/student_login',   to: 'student_sessions#new'
  get    '/student_login',   to: 'student_sessions#new'
  post   '/student_login',   to: 'student_sessions#create'
  delete '/student_logout',  to: 'student_sessions#destroy'
  
  get    '/instructor_edit',     to: 'instructors#edit'
  get    '/instructor_signup',   to: 'instructors#new'
  
  get    '/courses/edit',     to: 'courses#edit'
  #get    '/courses/new',   to: 'courses#new'
  
  get    '/instructor_login',   to: 'instructor_sessions#new'
  get    '/instructor_login',   to: 'instructor_sessions#new'
  post   '/instructor_login',   to: 'instructor_sessions#create'
  delete '/instructor_logout',  to: 'instructor_sessions#destroy'
  
  get '/team/add_students', to: 'teams#add_student'
  
  resources :students
  resources :instructors
  resources :projects
  resources :courses
  resources :student_teams
  resources :teams


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
