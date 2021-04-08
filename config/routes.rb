Rails.application.routes.draw do
  get 'equipments/index'
  get 'equipments/show'
  get 'equipments/edit'
  root 'home#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
