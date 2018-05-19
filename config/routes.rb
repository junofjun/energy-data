Rails.application.routes.draw do
  resources :cities, shallow: true do
    resources :houses do
      resources :energies
    end
    resources :energies
  end
  resources :houses
  resources :energies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
