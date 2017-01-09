Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  get 'users/new'

  resources :submissions do
    member do
      get 'select'
    end
  end
  resources :transcriptions, only: [:edit, :index, :show, :update]
  resources :patterns, only: [:index, :show]
  resources :questions, only: [:index, :show]
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
