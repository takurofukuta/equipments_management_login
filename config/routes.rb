Rails.application.routes.draw do
  root "equipments#index"
  resources :equipments
  resources :lendings
  get "/lendings/lendings_history", to: "lendings_history#index"
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }
end
