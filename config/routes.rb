Rails.application.routes.draw do
  get 'lendings/index'
  root 'equipments#index'
  resources :equipments
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
