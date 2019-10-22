Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  get '/students/:id/services', to: 'students#services'

  resources :admins
  resources :employees
  resources :holders
  resources :services
  resources :students
  resources :users
  resources :invoices, except: %i[create index]
  resources :paynments
end
