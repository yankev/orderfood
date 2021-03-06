Rails.application.routes.draw do
  resources :orders do
    resources :personal_orders
  end
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'orders#index'
  get '/personal_orders/add_to/:id', to: 'personal_orders#show'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  match 'orders/:id/release', to: 'orders#update_release', via: :patch
end
