Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/api/v1/representatives')
  namespace :api do
    namespace :v1 do
      resources :representatives, only: [:index]
    end
  end
end
