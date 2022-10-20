Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/transactions', to: 'transactions#create'
      get '/payer_balance', to: 'payer_balances#index'
    end
  end
end
