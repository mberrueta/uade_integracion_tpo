Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  get '/students/:id/services', to: 'students#services'

  resources :admins
  resources :employees do
    resources :absences, module: :employees, only: :create
  end
  resources :holders do
    resources :invoices, module: :holders, only: :index
    resources :payments, module: :holders, only: :index
  end
  resources :services
  resources :students do
    resources :invoices, module: :students, only: :index
  end
  resources :users
  resources :invoices, except: %i[create delete] do
    resources :payments, module: :invoices, only: :index
  end
  resources :payments
  resources :payroll, only: :index
end
