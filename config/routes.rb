Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'

  resources :users
  resources :holders
  resources :students
end
