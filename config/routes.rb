Rails.application.routes.draw do
  root "equipments#index"
  resources :equipments
  resources :lendings
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }
end
