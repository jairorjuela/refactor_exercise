Rails.application.routes.draw do
  root to: 'home#index'

  namespace :v1, defaults: { format: :json } do
    resources :books
    resources :authors
  end
end
