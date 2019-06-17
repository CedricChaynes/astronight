Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  root to: 'pages#home'
  resources :users, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events, only: %i[index show] do
    resources :messages, only: :create
    resources :participations, only: :create
    resources :materials, only: :create
    collection do
      get 'search', to: 'events#search'
    end
  end

  resources :participations, only: :destroy
  resources :sites, only: :update
end
