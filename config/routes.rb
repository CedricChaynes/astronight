Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events, only: :show do
    resources :messages, only: :create
    resources :participations, only: :create
    collection do
      get 'search', to: 'events#search'
    end
  end
  resources :participations, only: :destroy
end
