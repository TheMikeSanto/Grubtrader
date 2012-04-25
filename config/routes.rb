Foodbank::Application.routes.draw do
  resources :reports

  devise_for :users,  controllers:  {registrations: "users/registrations"},
                      path_names:   {sign_in: "login", sign_out: "logout"}

  resources :donations

  resources :orders

  match "/inventory" => "inventory#index"

  resources :units

  resources :products

  resources :users

  resources :organizations

  root :to => "dashboard#index"
end
