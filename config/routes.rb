Rails.application.routes.draw do
  get 'astronomical_events/shiw'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events, only: %i[show] do
    resources :participations, only: :create
    collection do
      get 'search', to: 'events#search'
    end
  end
  resources :participations, only: %i[destroy]
end
