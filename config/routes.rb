Rails.application.routes.draw do

  root to: 'geomancer#index'
  constraints(question_id: /[1-9]|1[0-9]|2[0-5]/) do
    get '/:question_id/', to: 'geomancer#question'
    constraints(rolls: /[1-4]{16}/) do
      get '/:question_id/:rolls',   to: 'geomancer#result'
      post '/:question_id/:rolls',  to: 'geomancer#create'
    end
  end
  
  scope '/about' do
    get '/:slug', to: 'static#pages', as: 'topic'
  end

  scope '/admin' do
    resources :pages
    resources :questions, only: [:index, :show] do  
      member do
        get 'lock'
      end
    end
    resources :tags, only: [:create, :update, :destroy]
    resources :transcriptions,  only: [:edit, :index, :show, :update] do
      member do
        get 'lock'
      end
    end
    resources :submissions, only: [:create, :index, :destroy] do
      member do
        get 'select'
      end
    end
    resources :users, only: [:new, :create, :index, :destroy, :edit, :update]
  end

  get    '/about',  to: 'static#about'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
