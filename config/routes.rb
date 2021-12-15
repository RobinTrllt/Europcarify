Rails.application.routes.draw do
  devise_for :users
  root to: 'agencies#index'
  get '/my_rentals', to: 'rentals#my_rentals', as: 'my_rentals'

  resources :agencies, only: %i[index show] do
    resources :vehicles, only: %i[index show] do
      resources :rentals, only: %i[new create]
    end
  end
  resources :rentals, only: %i[destroy]

end
