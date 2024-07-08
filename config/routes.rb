Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end

  unauthenticated do
    root 'posts#index', as: :unauthenticated_root
  end

  resources :posts, only: [:new, :create, :index]
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
