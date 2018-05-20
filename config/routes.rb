Rails.application.routes.draw do
  resources :cities, shallow: true do
    resources :houses do
      resources :energies, controller: :house_energies, only: :index
    end
    resources :energies, controller: :city_energies, only: :index
  end
  resources :houses
  resources :energies

  root 'cities#index'
end
