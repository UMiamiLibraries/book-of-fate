Rails.application.routes.draw do
  resources :submissions
  resources :transcriptions, only: [:edit, :index, :show, :update]
  resources :patterns, only: [:index, :show]
  resources :questions, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
