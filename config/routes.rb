Rails.application.routes.draw do
  root "equipments#index"
  get "operationhistories/index"
  get "/lendings_history/index", to: "lendings_history#index"
  get "/lendings", to: "lendings#index"
  post "/lendings/:id", to: "lendings#lending"
  patch "/lendings/:id", to: "lendings#return"

  resources :equipments

  resources :operation_histories
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }
end
