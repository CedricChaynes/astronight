Rails.application.routes.draw do
  get 'participations/create'
  get 'participations/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events, only: %i[index show] do

    resources :participations, only: %i[create destroy]

    collection do
      get 'search', to: 'events#search'
    end

  end

  resources :participations, only: %i[destroy]
end
