Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # A user can see all the lists, see the details of a given list and its name, and create a new list
  resources :lists, only: [:index, :new, :create, :show] do
    resources :bookmarks, only: [:new, :create] # A user can add a new bookmark (movie/list pair) to an existing list
  end

  resources :bookmarks, only: [:destroy] # A user can delete a bookmark from a list

  root "lists#index"
end
