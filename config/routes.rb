Rails.application.routes.draw do
  root 'equipments#index'
  resources :equipments
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
