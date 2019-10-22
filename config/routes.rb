Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  get '/students/:id/services', to: 'students#services'

  resources :users
  resources :holders
  resources :students
  resources :admins
  resources :employees
  resources :services
end
