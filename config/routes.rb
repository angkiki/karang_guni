Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :sellers, controllers: { sessions: 'sellers/sessions', registrations: 'sellers/registrations'}
  devise_for :buyers, controllers: { registrations: 'buyers/registrations', sessions: 'buyers/sessions' }

  root "home#index"

  resources :requests, only: [:new, :create, :index, :show]

  get '/buyer/request/:req_id', to: 'buyer_requests#new', as: 'new_buyer_request'
  post '/buyer/request/:req_id', to: 'buyer_requests#create', as: 'create_buyer_request'

  get '/buyers/bids', to: 'buyers#bids', as: 'buyer_bids'

  get '/buyers/:id', to: 'buyers#index', as: 'buyer'
  get '/sellers/:id', to: 'sellers#index', as: 'seller'

  get '/buyer/new_message/:seller_id', to: 'messages#buyer_new', as:'new_buyer_message'
  get '/seller/new_message/:buyer_id', to: 'messages#seller_new', as:'new_seller_message'

  post '/messages', to: 'messages#create'
  get '/messages', to: 'messages#index'

  get '/seller/messages', to:'messages#seller_show', as:'show_seller_message'





end
