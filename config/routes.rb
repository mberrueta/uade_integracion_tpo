Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  get '/students/:id/services', to: 'students#services'

  resources :admins
  resources :employees
  resources :holders do
    resources :invoices, module: :holders, only: :index
  end
  resources :services
  resources :students do
    resources :invoices, module: :students, only: :index
  end
  resources :users
  resources :invoices, except: %i[create delete]
  resources :payments
end
