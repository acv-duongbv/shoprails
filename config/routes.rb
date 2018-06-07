Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  post "/order/:id" => "orders#show"
  post "/hook" => "orders#hook"
  resources :orders
  resources :line_items
  resources :carts
  get "store/index"
  root :to => "store#index"
  resources :products
  get "admin/index"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
