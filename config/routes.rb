Rails.application.routes.draw do
  resources :orders do
    resources :personal_orders
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'orders#index'
  get '/personal_orders/add_to/:id', to: 'personal_orders#show'
  get 'signup', to: 'users#new', as: 'signup'
end
