Foodbank::Application.routes.draw do
  resources :reports

  devise_for :users

  resources :donation_lines

  resources :donations

  resources :orders

  resources :order_lines

  resources :inventories

  resources :roles

  resources :organization_roles

  resources :units

  resources :products

  resources :users

  resources :organizations

  root :to => "dashboard#index"
end
