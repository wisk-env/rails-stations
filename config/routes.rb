Rails.application.routes.draw do
  get 'schedules/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "movies" => "movies#index"
  namespace :admin do
    # get 'screens/index'
    # get 'screens/new'
    # get 'theaters/index'
    # get 'theaters/new'
    resources :movies
    resources :screens
    resources :theaters
  end
  namespace :admin do
    resources :theaters do
      resources :screens
    end
  end
  namespace :admin do
    resources :schedules
  end
  namespace :admin do
    resources :movies do
      resources :theaters do
        resources :schedules
      end
    end
  end
  namespace :admin do
    resources :reservations
  end
  resources :movies do
    collection do
      get 'search'
    end
  end
  resources :movies do
    resources :theaters do
      resources :schedules do
        resources :reservations, only: [:new]
      end  
    end
  end
  resources :reservations
  # get "movies/:movie_id/reservation", to: "movies#reservation"
  # 初級
  # resources :movies do
  #   get 'reservation', to: "movies#reservation"
  # end
  # 基礎
  resources :movies do
    resources :theaters do
      resources :schedules do
        get 'reservation', to: "movies#reservation"
      end  
    end
  end
  get "sheets" => "sheets#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
