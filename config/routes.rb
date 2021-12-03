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
  
  get    '/instructor_login',   to: 'instructor_sessions#new'
  get    '/instructor_login',   to: 'instructor_sessions#new'
  post   '/instructor_login',   to: 'instructor_sessions#create'
  delete '/instructor_logout',  to: 'instructor_sessions#destroy'
  
  resources :students
  resources :instructors
  resources :projects
  resources :teams
end
