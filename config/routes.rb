Rails.application.routes.draw do

  get 'pages/tag_pages'

  root               to: 'geomancer#index'
  constraints(question_id: /[0-9]+/) do
     get '/:question_id/',   to: 'geomancer#question'
     constraints(rolls: /[1-4]{16}/) do
     get '/:question_id/:rolls',  to: 'geomancer#result'
     post '/:question_id/:rolls', to: 'geomancer#create'
    end
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  scope '/admin' do
    resources :questions, only: [:index, :show]
    resources :patterns, only: [:index, :show]
    resources :transcriptions, only: [:edit, :index, :show, :update]
    resources :submissions do
      member do
        get 'select'
      end
    end
      resources :tags
      resources :users
  end
  
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
