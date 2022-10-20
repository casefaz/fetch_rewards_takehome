Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/transactions', to: 'transactions#create'
      get '/payer_balances', to: 'payer_balances#index'
      # RPC (breaks rest to do an action)
      resources :users, only: [] do
        member do
          post '/spend', to: 'users#spend_points'
        end
      end
    end
  end
end
