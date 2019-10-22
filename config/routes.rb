Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  get '/students/:id/services', to: 'students#services'

  resources :admins
  resources :employees
  resources :holders
  resources :services
  resources :students do
    resources :invoices, module: :students, only: :index
  end
  resources :users
  resources :invoices, except: %i[create delete]
  resources :payments
end
