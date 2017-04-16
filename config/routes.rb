Rails.application.routes.draw do

  root to: 'geomancer#index'
  constraints(question_id: /[0-9]+/) do
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
    resources :resources
    resources :tags
    resources :transcriptions,  only: [:edit, :index, :show, :update] do
      member do
        get 'lock'
      end
    end
    resources :submissions do
      member do
        get 'select'
      end
    end
    resources :users
  end

  get    '/about',  to: 'static#about'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
