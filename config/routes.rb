Rails.application.routes.draw do
  resources :restaurants, only: %i[index show new create]
end
