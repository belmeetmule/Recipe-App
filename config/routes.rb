Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  root "foods#index"

  
  # Defines the root path route ("/")
  
  # root "articles#index"
  #root "foods#index"
  #root to: 'users#index'

  #root to: foods_path
  resources :users, only: [:index, :show] do
    resources :foods, except: [:update]
    resources :recipes, except: [:update]
  end
  
end
