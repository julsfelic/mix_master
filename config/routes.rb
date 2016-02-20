Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :create]
    # resources :songs, shallow: true
  end

  resources :songs, only: [:show]
end
