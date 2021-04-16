Rails.application.routes.draw do
  get "operationhistories/index"
  root "equipments#index"
  resources :equipments
  resources :lendings
  resources :operation_histories
  get "/lendings_history/index", to: "lendings_history#index"
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }
end
