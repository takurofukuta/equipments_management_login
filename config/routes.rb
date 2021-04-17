Rails.application.routes.draw do
  root "equipments#index"
  get "operationhistories/index"
  get "/lendings_history/index", to: "lendings_history#index"
  resources :equipments
  resources :lendings
  resources :operation_histories
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }
end
