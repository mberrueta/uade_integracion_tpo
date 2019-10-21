Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'

  resources :users
  resources :holders
  resources :students
  resources :admins
  resources :employees
  resources :services
end
