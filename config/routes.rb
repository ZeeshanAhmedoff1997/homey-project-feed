Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root "projects#index", as: :authenticated_root
  end

  unauthenticated do
    root to: redirect("/users/sign_in")
  end

  resources :projects do
    member do
      get "edit"
      patch "transfer_ownership"
    end

    resources :project_feeds, only: [:create]
    resources :project_members, only: [:index, :create, :destroy] do
      delete :remove_member, on: :member
      post :add_member, on: :member
    end
    patch :transfer_ownership, on: :member
  end
end
